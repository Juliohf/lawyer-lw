class LawyerTagsController < ApplicationController
  def new
    @lawyer_tag = LawyerTag.new
    authorize @lawyer_tag
  end

  def create
    @tags = Tag.where(id: params[:lawyer_tag][:tag])
    @tags.each do |tag|
      @lawyer_tag = LawyerTag.new(user: current_user, tag: tag)
      authorize @lawyer_tag
      @lawyer_tag.save
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @lawyer_tag = LawyerTag.find(params[:id])
    authorize @lawyer_tag
    @lawyer_tag.destroy
    redirect_to user_path(current_user), status: :see_other
  end
end
