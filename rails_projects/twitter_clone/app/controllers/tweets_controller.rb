class TweetsController < ApplicationController
  #before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  def new
    @tweet = Tweet.new
    respond_to do |format|
        format.html { render :new }
        format.js { render :new }
      end
  end
  
  def create
    current_user = User.find(params[:user_id])
    puts params[:tweet][:message]
    @new_tweet = current_user.tweets.new(tweet_params)
    if @new_tweet.save
      flash[:notice] = "Votre tweet a bien été créé"
      respond_to do |format|
        format.html { redirect_to user_path(current_user.id) }
        format.js { render :added_tweet }
      end
    else
      flash[:notice] = "Votre tweet n'a pas été créé"
      render :new
    end
  end
  
  private

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end

end