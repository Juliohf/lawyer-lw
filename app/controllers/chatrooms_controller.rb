class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    @chatroom_lawyer = User.find(params[:user_id])
    @chatroom_client = current_user
    @chatroom = Chatroom.new(name: "Conversation #{@chatroom_lawyer.name} - #{@chatroom_client.name}")
    @chatroom.lawyer_id = @chatroom_lawyer.id
    @chatroom.client_id = @chatroom_client.id
    authorize @chatroom
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end
end
