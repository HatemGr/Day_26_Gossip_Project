class PagesController < ApplicationController

  def team
  end

  def contact
  end

  def welcome
    @name = params[:first_name]
  end

end