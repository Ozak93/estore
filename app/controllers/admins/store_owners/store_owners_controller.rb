class Admins::StoreOwners::StoreOwnersController < ApplicationController
  def index
    @owners = User.owner.latest.page params[:page]
  end
end
