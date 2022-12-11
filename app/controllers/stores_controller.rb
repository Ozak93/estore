class StoresController < ApplicationController
  before_action :authenticate_admin_or_owner!, only: [:new, :create, :edit, :update, :destroy]
  before_action :store_params, only: [:create, :update]
  before_action :store_id, only: [:show, :edit, :update, :destroy]

  def index
    @stores = case current_user.role
                when 'owner'
                  current_user.stores.page params[:page]
                else
                  Store.latest.page params[:page]
                end
  end

  def new
    @store = Store.new
  end

  def create
    current_user.stores.create!(@_params)
  end

  def show
    @store = Store.find(@id)
    @products = @store.products.order(created_at: :desc).page params[:page]
  end

  def update
    current_user.store(@id).update!(@_params) if owner_signed_in?
    Store.find(@id).update!(@_params)
  end

  def edit
    @store = case current_user.role
             when 'owner'
               current_user.store(@id)
             else
               Store.find(@id)
             end
  end

  def destroy
    current_user.store(@id).delete if owner_signed_in?
    Store.delete(@id)
  end

  private

  def store_id
    @id = params[:id]
  end

  def store_params
    @_params = params.require(:store).permit(:name, :image)
  end
end
