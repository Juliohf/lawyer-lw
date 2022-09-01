class ReviewsController < ApplicationController
  before_action :set_user, only: %i[new create]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = @user
    authorize @review
    @review.save
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:comments, :ratings)
  end
end
