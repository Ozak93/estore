class CategoriesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :create, :destroy]
  before_action :category_params, only: [:create, :edit]
  before_action :category_id, only: [:edit, :show, :destroy]

  def index
    @categories = Category.all.page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    category = current_user.categories.new(category_params)

    if category.valid?
      category.save!
      redirect_to root_path
    end
  end

  def show
    @category = Category.find(@id)
    @products = @category.products.order(created_at: :desc).page params[:page]
  end

  def edit
    @category = Category.find(@id)
  end

  def destroy
    Category.delete(params[:category_id].to_i)
    redirect_to categories_path
  end

  private

  def category_id
    @id = params[:id]
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def authenticate_admin!
    redirect_to categories_path, data: { 'turbo-message': 'Unauthorized' } unless admin_signed_in?
  end
end
