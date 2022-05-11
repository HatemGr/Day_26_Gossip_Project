class UsersController < ApplicationController
  def new
    @user = User.new
    @cities = City.all
  end

  def create 
    puts "#" * 50
    puts params
    puts "#" * 50
    puts user_params
    puts "#" * 50
    new_user_params = user_params.merge(city: City.find(params[:city]))
    puts new_user_params
    puts "#" * 50

    @user = User.new(new_user_params)
    @cities = City.all
    
    if @user.save
      flash[:success] = "Compte créé"
      redirect_to user_path(@user)
    else
      error_messages = ""
      @user.errors.full_messages.each do |error|
        error_messages += error + "<br/>"
      end
      flash[:danger] = "Erreur dans la saisie des données"
      flash[:errors] = error_messages
      render :new
    end
  end
  
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private 
  def user_params 
    params.require(:user).permit(:first_name, :last_name, :city, :email, :description, :age, :password, :password_confirmation)
  end
end
