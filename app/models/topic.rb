class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  has_many :comments

  attr_accessible :description, :name, :topic_id

  validates :name, length: { minimum: 5 }

end
