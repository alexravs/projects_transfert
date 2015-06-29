class RegionsController < ApplicationController
  def new
    @region = Region.new
    render :new
  end
  
  def create
    @region = Region.new(params[:region])
    if @region.save()
      redirect_to new_region_path
    else
      render :new
    end
  end
  
private
  def region_params
    params.require(:region).permit(:name, :zipcode, :country)
  end
end