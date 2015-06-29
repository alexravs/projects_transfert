class EstablishmentsController < ApplicationController
  def index
    #require_relative 'citiesdb'
    @establishments = Establishment.all
    @userr = User.find(16)
    render :index
    
  end
  
  def new
    @establishment = Establishment.new
    @city = City.new
    render :new
  end
  
  def create
    @establishment = Establishment.new(params[:establishment])
    @city = City.create(params[:city])
    @establishment.city = @city
    
    if @establishment.save()
      puts "should create an alert to inform user."
      redirect_to new_establishment_path
    else
      render :new
    end
  end
  
  def visited_this_place
    @place_visited = Establishment.find(params[:id])
    @visitor = User.find(1)
    if @place_visited.has_been_visited_by @visitor
      redirect_to establishment_path(@place_visited)
    else
      render :notok
    end
  end
  
  def show
    @establishment = Establishment.find(params[:id])
    @review = Review.new
    render :show
  end
  private
  def establishment_params
    params.require(:establishment).permit(:name, :description, :adress, :city, :logo)
  end
end