class Admins::DashboardController < ApplicationController
  def index
    @stores = Store.all?
  end
end
