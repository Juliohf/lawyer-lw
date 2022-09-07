class ProfilesController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @review = Review.new
    @chatrooms_as_client = current_user.chatrooms_as_client
    @chatrooms_as_lawyer = current_user.chatrooms_as_lawyer
  end
end
