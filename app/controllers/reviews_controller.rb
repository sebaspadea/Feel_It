class ReviewsController < ApplicationController
  def new
  # we need @restaurant in our `simple_form_for`
  @experience = Experience.find(params[:experience_id])
  @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @experience = Experience.find(params[:experience_id])
    @review.experience = @experience
    if @review.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
