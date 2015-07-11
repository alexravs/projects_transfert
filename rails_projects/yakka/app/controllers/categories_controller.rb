class CategoriesController < ApplicationController
  helper_method :notes, :note
  respond_to :json, only: [:index, :create, :update, :destroy]
  respond_to :html, only: [:index]
  
  def index
    respond_with categories
  end
  
  
  def create
    note = Note.create(note_params)
    respond_with note
  end
  
  def update
    category.update_attributes(category_params)
    respond_with category
  end
  
  def destroy
    respond_with category.destroy
  end
  
private
  
  def category_params
    params.permit(:nom, :stat)
  end
  
  def categories
    @_categories ||= Category.all
  end
  
  
  
  def category
    @_category ||= categories.find(params[:id]) 
  end
end