class ProductsController < ApplicationController
  #before_action :authenticate_admin_or_owner!, only: [:new, :edit, :create, :destroy]
  before_action :product_params, only: [:create, :edit]
  before_action :product_id, only: [:edit, :show, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create!(product_params(:name, :price, :stock_quantity))
  end

  def show
    @product = Product.find(@id)
  end

  def edit
    @product = Product.find(@id)
  end

  def destroy
    Product.delete(@id)
  end

  private

  def product_id
    @id = params[:id]
  end

  def product_params(*fields)
    params.require(:product).permit(fields)
  end

end
