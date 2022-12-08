class Admins::Users::UsersController < ApplicationController
  def index
    @users = User.latest.page params[:page]
  end
end
