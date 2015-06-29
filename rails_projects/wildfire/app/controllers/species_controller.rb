class SpeciesController < ApplicationController
  
  def new
    @species = Species.new
    render :new
  end
  
  def create
    @species = Species.new(params[:species])
    if @species.save()
      redirect_to new_species_path
    else
      render :new
    end
  end
  
private
  def species_params
    params.require(:species).permit(:name)
  end
  
end