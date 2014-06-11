class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]
 attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :provider, :uid
 has_many :articles
 has_many :comments

 has_many :payments


 def already_purchased?(article)
  self.payments.find_by_article_id(article)
 end

 def self.find_for_facebook_oauth(auth)
   where(auth.slice(:provider,:uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.image = auth.info.image
  end
end

def self.new_with_session(params, session)
     super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data]"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
   end
end

end
