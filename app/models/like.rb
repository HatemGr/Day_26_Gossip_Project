class Like < ApplicationRecord
  validates :user, uniqueness: {scope: :gossip}
  
  belongs_to :user
  belongs_to :gossip
end
