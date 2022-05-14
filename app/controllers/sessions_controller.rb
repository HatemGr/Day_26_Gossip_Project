class SessionsController < ApplicationController
  def new
  end

  def create
    puts "#" * 50
    puts params
    puts "#" * 50
    session_params = params.require(:session).permit(:email, :password)
    remembrance = params.require(:session).permit(:remembrance)
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      remember(user) if remembrance
      flash[:success] = "Tu es connecté"
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    flash[:success] = "Tu es deconnecté"
    forget(current_user) if current_user
    session.delete(:user_id)
    redirect_to root_path
  end

  def profile
  end
  
end