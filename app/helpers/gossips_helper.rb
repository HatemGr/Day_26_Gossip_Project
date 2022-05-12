module GossipsHelper

  def like_counter(gossip)
    gossip.likes.size
  end
  def comment_counter(gossip)
    gossip.comments.size
  end

end
