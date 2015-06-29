class SightingsController < ApplicationController
  
  def index
    @sighting = Sighting.new
    render :index
  end
  
  def create
    @species = Species.find(1)

    @sighting = Sighting.new(params[:sighting])
    if @sighting.save()
      redirect_to root_path
    else
      render :index
    end
  end
  
  def search_sightings_trough_dates
    puts "hello" + params[:sighting].fetch(:region_id)
    if !(params[:sighting].fetch(:region_id).nil? || params[:sighting].fetch(:region_id) == 0) 
      @sightings = Sighting.between_and_located( params[:first_date], params[:second_date], params[:sighting].fetch(:region_id) )
      
    else
      @sightings = Sighting.between( params[:first_date], params[:second_date] )     

    end
    
    render :searched_sightings
  end 
  
private
  def sighting_params
    params.require(:sighting).permit(:name, :longetitude,:latitude,:date,:species)
  end
end