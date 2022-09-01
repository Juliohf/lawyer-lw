class UsersController < ApplicationController

  def index
    @lawyers = Users.all
    @lawyers.where(type: :lawyer)
  end
end
