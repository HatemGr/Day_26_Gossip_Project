class Gossip < ApplicationRecord
  validates :title, :content, presence: true
  validates :title, length: { in: 3..14 }
  
  belongs_to :user
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments

  def self.get_gossip_by_id(id)
    return Gossip.all[id.to_i-1]
  end

end
