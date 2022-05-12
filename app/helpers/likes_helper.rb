module LikesHelper

  def already_liked?(user,gossip)
    Like.find_by(user: user, gossip: gossip)
  end

  def find_like(user, gossip)
    Like.find_by(user: user, gossip: gossip)
  end

end
