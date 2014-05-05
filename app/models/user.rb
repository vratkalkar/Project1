class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 attr_accessible :email, :password, :password_confirmation, :remember_me, :name
 has_many :topics
 has_many :articles
 has_many :comments

end
