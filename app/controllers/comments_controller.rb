class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @users = User.all
    @comment = Comment.new
    
  end
  
  def create
    puts "#" * 50
    puts params
    puts "#" * 50
    puts comment_params
    
    @comment = Comment.new(content: comment_params[:content], gossip: Gossip.find(params[:gossip_id]), user: User.find_by(id: session[:user_id]))
    #@comment = Comment.new(content: comment_params[:content], gossip: Gossip.find(params[:gossip_id]),user: User.find(params[:comment_author_id]))
    
    if @comment.save
      flash[:success] = "Commentaire sauvegardé"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:danger] = "Erreur dans la saisie du commentaire"
      error_messages = ""
      @comment.errors.full_messages.each do |error|
        error_messages += error + ", "
      end
      flash[:danger] = "Erreur dans la saisie du commentaire"
      flash[:errors] = error_messages
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to gossip_path(params[:gossip_id])
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to gossip_path(params[:gossip_id])
    else
      render :show
    end
  end

  private

  def comment_params
    comment_params = params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
