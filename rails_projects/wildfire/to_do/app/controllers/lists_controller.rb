class ListsController < ApplicationController
  def index
    @lists = List.all
    render :index
  end
  
  def show
    @list = List.find(params[:id])
    render :show
  end
  
  def new
    @list = List.new 
    render :new
  end
  
  def create
    @list = List.new params[:list]
    
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to lists_path
    else
      flash[:alert] = "there were some problem!"
      render :new
    end
  end
  
  def edit
    @list = List.find(params[:id])
    render :edit
  end
  
  def update
    @list = List.find params[:id]
    
    if @list.update(params[:list])
      redirect_to lists_path
    else
      render :edit
    end
  end
  
  def destroy
    @list = List.find params[:id]
    @list.destroy
    
    redirect_to lists_path
  end
end