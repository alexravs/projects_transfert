class UsersController < ApplicationController
  def new
    @user = User.new()
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup_confirmation(@user).deliver

      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def starts_following
    @user_to_be_followed = User.find(params[:id])
    @follower = User.find(3)
    if @user_to_be_followed.starts_to_be_followed_by @follower
      @user_to_be_followed.users.push(@follower)
      redirect_to user_path(@user_to_be_followed)
    else
      render :notok
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation, :avatar)
  end
end