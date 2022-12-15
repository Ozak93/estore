class Owners::DashboardController < ApplicationController
  before_action :authenticate_owner
  def index
    # @orders = []
    # products_orders = []
    # current_user.products.each { |product| products_orders += product.order_product_records}
    # @orders << products_orders.join('orders')
    respond_to do |format|
      format.html
      format.json {render json: OrderProductRecordDatatable.new(params, {current_user: current_user})}
    end
  end

  private

  def authenticate_owner
    redirect_to root_path unless owner_signed_in?
  end
end
