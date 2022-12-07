class Admins::DashboardController < ApplicationController
  def index
    redirect_to root_path unless admin_signed_in?
    @stores = Store.all
  end
end
