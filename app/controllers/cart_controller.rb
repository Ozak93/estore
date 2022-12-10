class CartController < ApplicationController
  before_action :added_product, only: [:update]

  def index
    @cart = []
    session[:cart].each { |item|  @cart.push(Product.find_by(name: item))} unless session[:cart].nil?
  end

  def update
    p "============Product#{@_product}========>", Product.find(@_product.to_i), '<=============================='
    ensure_cart_session_exists
    session[:cart] << Product.find(@_product.to_i).name
    # redirect_to :back
  end

  private

  def added_product
    @_product = params.require(:product)
  end

  def ensure_cart_session_exists
    session[:cart] ||= []
  end
end
