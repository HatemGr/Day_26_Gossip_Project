class Comment < ApplicationRecord
  validates :content, length: { minimum: 1 }
  
  belongs_to :gossip
  belongs_to :user
  
end
