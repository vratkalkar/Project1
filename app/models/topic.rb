class Topic < ActiveRecord::Base
  belongs_to :users
  has_many :articles
  has_many :comments

  attr_accessible :description, :name
end
