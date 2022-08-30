class UsersController < ApplicationController
  def index
    @lawyers = policy_scope(User)
  end

  def show
    authorize @lawyer
  end
end
