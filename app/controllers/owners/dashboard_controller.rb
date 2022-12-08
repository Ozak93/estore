class Owners::DashboardController < ApplicationController
  before_action :authenticate_owner
  def index
  end

  private

  def authenticate_owner
    redirect_to root_path unless owner_signed_in?
  end
end
