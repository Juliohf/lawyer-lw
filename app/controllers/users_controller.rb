class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @tag = ""
    @category = ""
    @location = ""
    @nocategory = "I do not know"

    if @category == @nocategory
      if @location.empty?
        @lawyers = policy_scope(User.tag_search(@tag))
      else
        @lawyers_location = User.location_search(@location)
        @lawyers = policy_scope(@lawyers_location.tag_search(@tag))
      end
    elsif @location.empty?
      @lawyers = policy_scope(User.category_search(@category))
    else
      @lawyers_location = User.location_search(@location)
      @lawyers = policy_scope(@lawyers_location.category_search(@category))
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @review = Review.new
    @chatroom = Chatroom.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to user_path(@user)
  end
end
