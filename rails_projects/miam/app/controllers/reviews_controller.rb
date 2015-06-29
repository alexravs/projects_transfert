class ReviewsController < ApplicationController
  def create
    @establishment = Establishment.find(params[:establishment_id])
    @user = User.find(1)
    @review = @establishment.reviews.new(params[:review])
    @review.user = @user
    if @review.save()
      redirect_to root_path
    else
      render establishment_path(@preview.establishment)
    end
  end
end