class Article < ActiveRecord::Base
  belongs_to :users
  belongs_to :topic
  has_many :comments

  attr_accessible :body, :title

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    new_record?
  end
end
