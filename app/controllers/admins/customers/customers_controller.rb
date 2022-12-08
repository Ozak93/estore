class Admins::Customers::CustomersController < ApplicationController
  def index
    @customers = User.customer.latest.page params[:page]
  end
end
