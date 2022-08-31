class UsersController < ApplicationController

  def index
    @lawyers = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to user_path(@user)
  end
end
