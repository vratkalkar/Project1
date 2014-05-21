class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
 attr_accessible :email, :password, :password_confirmation, :remember_me, :name
 has_many :articles
 has_many :comments

 has_many :payments


 def already_bought?(article)
  self.payment.where(:article_id).present?
 end

end
