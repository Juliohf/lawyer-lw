class LawyerCategoriesController < ApplicationController
  def new
    @lawyer_category = LawyerCategory.new
    authorize @lawyer_category
  end

  def create
    @categories = Category.where(id: params[:lawyer_category][:category])
    @categories.each do |category|
      @lawyer_category = LawyerCategory.new(user: current_user, category: category)
      authorize @lawyer_category
      @lawyer_category.save
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @lawyer_category = LawyerCategory.find(params[:id])
    authorize @lawyer_category
    @lawyer_category.destroy
    redirect_to user_path(current_user), status: :see_other
  end
end
