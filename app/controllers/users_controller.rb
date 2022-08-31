class UsersController < ApplicationController

  def index
    @lawyers = policy_scope(User)
  end

  def show
    @lawyer = User.find(params[:id])
    authorize @lawyer
  end

end
