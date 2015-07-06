class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    format do |f| 
      
    end
  end
end