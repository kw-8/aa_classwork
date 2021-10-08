class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index #index file in cats views
  end

  def show
  end
end
