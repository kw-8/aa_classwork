class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index #index file in cats views
  end

  def show #/cats/:id
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    
  end
end
