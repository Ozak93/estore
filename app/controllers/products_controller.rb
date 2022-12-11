class ProductsController < ApplicationController
  before_action :authenticate_admin_or_owner!, only: [:new, :edit, :update, :destroy]
  before_action :authenticate_customer, only: [:filter]
  before_action :product_params, only: [:create, :update]
  before_action :product_id, only: [:edit, :show, :update, :destroy]
  before_action :filter_params, only: [:filter]
  before_action :categories, only: [:new, :index]
  before_action :filters, only: [:index, :index_med_price, :index_high_price, :index_low_price]
  helper_method :customer_signed_in?

  def index
      @products = Product.order(created_at: :desc).page params[:page]
      @products = current_user.latest_products.page params[:page] if owner_signed_in?
  end

  def index_low_price
    @products = Product.filtered_and_paginated params[:page], 'price', {price_scope: :price_less_than, values:{value: 50}}
  end
  def index_med_price
    @products = Product.filtered_and_paginated params[:page], 'price', {price_scope: :price_in_between, values:{lower_val: 50, upper_val: 250}}
  end
  def index_high_price
    @products = Product.filtered_and_paginated params[:page], 'price', {price_scope: :price_more_than, values:{value: 250}}
  end

  def filter
    case @_filters['name']
    when 'category'
      redirect_to categories_path
    when 'low_price'
      redirect_to :action => :index_low_price
    when 'medium_price'
      redirect_to :action => :index_med_price
    when 'high_price'
      redirect_to :action => :index_high_price
      else 'date'
      redirect_to :action => :index
    end
    # redirect_to :action => :index, filter: @_filters['name']
  end

  def new
    @product = Product.new
  end

  def create
    product = current_user.products.create!(@_params.slice(:name, :price, :store_id, :stock_quantity, :image))
    product.categories << @_params[:categories].drop(1).map { |cat_id| Category.find(cat_id) }
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
    @_params = params.require(:product).permit(:name, :price, :stock_quantity, :store_id, :image, categories: [])
  end

  def authenticate_admin_or_owner!
    redirect_to products_path unless admin_signed_in? or owner_signed_in?
  end

  def authenticate_customer
    redirect_to products_path unless customer_signed_in? or !user_signed_in?
  end

  def filter_params
    @_filters = params.require(:filters).permit(:name)
  end

  def categories
    @categories = Category.order(created_at: :desc)
  end

  def filters
    @filters = Filter.all
  end

end
