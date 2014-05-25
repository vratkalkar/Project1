class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  attr_accessible :user_id, :article_id

  
end
