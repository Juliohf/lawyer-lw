class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index

    @category = ResponsesApi::RetrieveResponsesRequest.execute('HAd1hkqJ', token: 'tfp_5CUAim62DW8oE1FJWmi3Uj32R6d22TqhE5JetZthYzLQ_3mNZ3CjtrpP96s').responses[0].answers[1].text
    @location = ResponsesApi::RetrieveResponsesRequest.execute('HAd1hkqJ', token: 'tfp_5CUAim62DW8oE1FJWmi3Uj32R6d22TqhE5JetZthYzLQ_3mNZ3CjtrpP96s').responses[0].answers[0].text
    @nocategory = "I'm not sure..."

    if @category == @nocategory
      @tag =  ResponsesApi::RetrieveResponsesRequest.execute('HAd1hkqJ', token: 'tfp_5CUAim62DW8oE1FJWmi3Uj32R6d22TqhE5JetZthYzLQ_3mNZ3CjtrpP96s').responses[0].answers[2].choice.label
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
    # @lawyers = policy_scope(User)
    @markers = @lawyers.geocoded.map do |user|
      { lat: user.latitude, lng: user.longitude }
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
