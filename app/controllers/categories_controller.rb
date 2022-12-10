class CategoriesController < ApplicationController
  #before_action :authenticate_admin!, only: [:new, :edit, :create, :destroy]
  before_action :category_params, only:[:create, :edit]
  before_action :category_id, only: [:edit, :show, :destroy]

  def index
    @categories = Category.latest.page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    Category.create!(category_params(:name))
  end

  def show
    @category = Category.find(@id)
  end

  def edit
    @category = Category.find(@id)
  end

  def destroy
    Category.delete(@id)
  end

  private

  def category_id
    @id = params[:id]
  end

  def category_params(field)
    params.require(:category).permit(field)
  end
end
