class UsersController < ApplicationController
  def index
    render 'index'
  end
  def show
    render 'show'
  end
  
  def starts_following
    @user_to_be_followed = User.find(params[:id])
    @follower = current_user
    if @user_to_be_followed.starts_to_be_followed_by @follower
      @user_to_be_followed.users.push(@follower)
      respond_to do |format|
        format.html { redirect_to :back}
       format.js { render :followed_user }
      end
    else
      flash[:alert] = "user non suivie"
    end
  end
  
  def stop_following
    @user_followed = User.find(params[:id])
    @follower = current_user
    @user_followed.delete_follower(@follower)
    respond_to do |format|
      format.html { redirect_to :back}
      format.js { render :stop_followed_user }
    end
  end
end