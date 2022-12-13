class Admins::UserssController < ApplicationController
  before_action :authenticate_admin!
  before_action :user_params, only: [:update, :create]
  before_action :user_roles, only: [:new, :edit]

  def index
    @users = User.all.page params[:page]
  end

  def new
    @user = User.new

  end

  def create
    User.create!(@params)
    redirect_to admin_users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update!(@params)
    redirect_to admin_users_path
  end

  def destroy
    User.find(params[:id]).delete
    redirect_to admin_users_path(current_user.id)
  end

  private

  def user_params
    @params = params.require(:user).permit(:id, :name, :email, :password, :image)
  end

  def authenticate_admin!
    redirect_to root_path unless admin_signed_in?
  end

  def user_roles
    roles = User.roles.keys
    roles.pop
    @roles = roles.map {|role| [role.titleize,role]}
  end

end
