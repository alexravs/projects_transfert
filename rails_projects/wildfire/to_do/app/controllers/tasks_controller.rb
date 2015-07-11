class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end
  
  def create
    
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    @task.done = false
    if @task.save
      flash[:notice] = "Your task has been successfully added"
      redirect_to list_path(@task.list)
      
    else
      flash[:alert] = "there were some problems while we tried to process the creation of your task .."
      render :new
    end
  end
  
  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    render :edit
  end
  
  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    
    if @task.update(params[:task])
      flash[:notice] = "Your task has been successfully edited"
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end
  
  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Your task has been successfully deleted"
    else
      flash[:alert] = "there were some problems while we tried to delete your task .."
    end
    redirect_to list_path(@task.list)

  end
  
  def done_true
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    Task.update(params[:id], :done => true)
    redirect_to list_path(@task.list)
  end
  
  def done_false
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    Task.update(params[:id], :done => false)
    redirect_to list_path(@task.list)
  end
end