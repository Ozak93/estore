class StoresController < ApplicationController
  #before_action :authenticate_admin_or_owner!, only: [:new, :edit, :create, :destroy]
  before_action :store_params, only: [:create, :edit]
  before_action :store_id, only: [:edit, :show, :destroy]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    Store.create!(store_params(:name))
  end

  def show
    @store = Store.find(@id)
  end

  def edit
    @store = Store.find(@id)
  end

  def destroy
    Store.delete(@id)
  end

  private

  def store_id
    @id = params[:id]
  end

  def store_params(field)
    params.require(:store).permit(field)
  end
end
