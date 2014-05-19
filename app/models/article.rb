class Article < ActiveRecord::Base
  belongs_to :users
  belongs_to :topic
  has_many :comments

  attr_accessible :body, :title


  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]


end
