class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :update, :destroy]
  before_action :set_gossip, only: [:show, :update, :destroy, :edit]

  def index
    @gossips = Gossip.all
  end

  def new
    @users = User.all
    @gossip = Gossip.new
    @tags = Tag.all
  end

  def create

    @gossip = Gossip.new(title: params[:new_gossip_title], content: params[:new_gossip_content], user: User.find_by(id: session[:user_id]))
    #@gossip = Gossip.new(title: params[:new_gossip_title], content: params[:new_gossip_content], user: nil)
    #@gossip = Gossip.new(title: params[:new_gossip_title], content: params[:new_gossip_content], user: User.find(params[:new_gossip_author_id]))
    @users = User.all

    unless params[:tags_id].nil?
      params[:tags_id].each do |tag_id|
        GossipTag.create(gossip: @gossip, tag: Tag.find(tag_id))
      end
    end
    
    if @gossip.save 
      flash[:success] = "Le gossip a été sauvegardé"
      redirect_to root_path
    else
      error_messages = "" 
      @gossip.errors.full_messages.each do |error|
        error_messages += error + "<br/>"
      end
      flash[:danger] = "Il y a une erreur avec les entrées du gossip"
      flash[:errors] = error_messages
      redirect_to new_gossip_path
    end
  end

  def show
    @comment = Comment.new
    @users = User.all
  end

  def edit
    @tags = Tag.all
  end

  def update
    if @gossip.update(gossip_params)
      GossipTag.where(gossip: @gossip).destroy_all
      params[:tags_id].each do |tag_id|
        GossipTag.create(gossip: @gossip, tag: Tag.find(tag_id))
      end
      flash[:success] = "Le gossip a été mis à jour"
      redirect_to @gossip
    else
      flash[:danger] = "Il y a une erreur avec les entrées de la mise à jour"
      render :edit
    end
  end

  def destroy
    if @gossip.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def gossip_params
    gossip_params = params.require(:gossip).permit(:title, :content)
  end

  def set_gossip 
    @gossip = Gossip.find(params[:id])
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
