class StaticPagesController < ApplicationController
  def show
    @name = params[:id]
  end
end
