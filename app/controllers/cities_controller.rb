class CitiesController < ApplicationController
  def index
  end

  def show
    @city = City.find(params[:id])
  end
end
