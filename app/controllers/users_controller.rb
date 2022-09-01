class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @lawyers = policy_scope(User).where(user_type: "lawyer")
    @markers = @lawyers.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
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
