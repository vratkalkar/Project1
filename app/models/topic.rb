class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  has_many :comments

  attr_accessible :description, :name

  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 10}

end
