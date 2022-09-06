class ProfilesController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @review = Review.new
  end
end
