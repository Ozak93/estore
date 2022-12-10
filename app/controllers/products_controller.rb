class ProductsController < ApplicationController
  before_action :authenticate_admin_or_owner!, only: [:new, :edit, :update, :destroy]
  before_action :product_params, only: [:create, :update]
  before_action :product_id, only: [:edit, :show, :update, :destroy]

  def index
    if user_signed_in? and current_user.owner?
      @products = current_user.latest_products.page params[:page]
      p '=================SUUUUUUP====>', @products, '<============================'
    else
      @products =
        Product.filtered_and_paginated params[:page]
    end
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create!(@_params)
    redirect_to product_path(product)
  end

  def show
    @product = Product.find(@id)
  end

  def edit
    @product = Product.find(@id)
  end

  def update
    Product.find(@id).update!(@_params)
  end

  def destroy
    Product.delete(@id)
  end

  private

  def product_id
    @id = params[:id]
  end

  def product_params
    @_params = params.require(:product).permit(:name, :price, :stock_quantity, :store_id, :image, pictures: [])
  end

  def authenticate_admin_or_owner!
    redirect_to products_path unless admin_signed_in? or owner_signed_in?
  end

end
