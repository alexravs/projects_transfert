class CitiesController < ApplicationController
  def search_cities
    @cities = City.searchStartWith(params[:prefix])
    
    respond_to do |format|
      format.html { render :test }
      format.js { render :test }
    end
  end
end