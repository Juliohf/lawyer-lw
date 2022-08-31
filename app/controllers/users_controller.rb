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
end
