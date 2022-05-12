class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user

  def create
    puts "#" * 50
    puts "Like enregistré"
    puts "#" * 50
    @like = Like.new(user: current_user, gossip: Gossip.find_by(id: params[:gossip_id]))

    if @like.save
      puts "#" * 50
      puts "Like enregistré"
      puts "#" * 50
      redirect_to gossip_path(params[:gossip_id])
      else
      puts "#" * 50
      puts "Like pas enregistré"
      puts "#" * 50
      redirect_to gossip_path(params[:gossip_id])
    end
  
  end
  

  def destroy
    puts "#" * 50
    puts params
    puts "#" * 50
    Like.find(params[:id]).destroy
    redirect_to gossip_path(params[:gossip_id])
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to gossip_path(params[:gossip_id])
    end
  end

end