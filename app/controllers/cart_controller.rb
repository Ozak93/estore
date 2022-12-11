class CartController < ApplicationController
  before_action :added_product, only: [:update]
  before_action :sign_customer_up, only: [:create]
  before_action :authenticate_customer

  def show
    @order = Order.new
    @cart = []
    session[:cart].each do |item|
      product = Product.find_by(name: item['product'])
      @cart.push({ product: product , amount: item['amount'] })
      order.products << product
      end unless session[:cart].nil?

  end

  def create
    order_params = params.require(:order).permit(cart:[])

  end

  def update
    ensure_cart_session_exists
    prod = Product.find(@_product['product_id'].to_i)
    amount = @_product['amount']
    session[:cart] << { product: prod.name, amount:  }
    prod.update!(stock_quantity: (prod.stock_quantity - amount))
    # redirect_to :back
  end

  private

  def added_product
    @_product = params.require(:product)
  end

  def ensure_cart_session_exists
    session[:cart] ||= []
  end

  def sign_customer_up
    redirect_to new_customer_registration_path unless customer_signed_in?
  end

  def authenticate_customer
    redirect_to root_path unless customer_signed_in? or !user_signed_in?
  end
end
