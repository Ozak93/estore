class Admins::ProductsController < ApplicationController
  def index
    @products = Product.latest.page params[:page]
  end
end
