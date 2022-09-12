class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index

    @category = ResponsesApi::RetrieveResponsesRequest.execute('HAd1hkqJ', token: ENV["TYPEFORM_API_TOKEN"]).responses[0].answers[1].text
    @location = ResponsesApi::RetrieveResponsesRequest.execute('HAd1hkqJ', token: ENV["TYPEFORM_API_TOKEN"]).responses[0].answers[0].text
    @nocategory = "I'm not sure..."

    # if @category == @nocategory
    #   @tag =  ResponsesApi::RetrieveResponsesRequest.execute('HAd1hkqJ', token: ENV["TYPEFORM_API_TOKEN"]).responses[0].answers[2].choice.label
    #   if @location.empty?
    #     @lawyers = policy_scope(User.tag_search(@tag))
    #   else
    #     @lawyers_location = User.location_search(@location)
    #     @lawyers = policy_scope(@lawyers_location.tag_search(@tag))
    #   end
    # elsif @location.empty?
    #   @lawyers = policy_scope(User.category_search(@category))
    # else
    #   @lawyers_location = User.location_search(@location)
    #   @lawyers = policy_scope(@lawyers_location.category_search(@category))
    # end
    @lawyers = policy_scope(User)

    @markers = @lawyers.geocoded.map do |user|
      { lat: user.latitude, lng: user.longitude, info_window: render_to_string(partial: "popup", locals: {user: user})}
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
    redirect_to user_path(@user)
  end
end
