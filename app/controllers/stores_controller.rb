class StoresController < ApplicationController
  before_action :authenticate_admin_or_owner!, only: [:new, :create, :edit, :update, :destroy]
  before_action :store_params, only: [:create, :update]
  before_action :store_id, only: [:show, :edit, :update, :destroy]

  def index
    @stores = if user_signed_in? and owner_signed_in?
      current_user.stores.page params[:page]
    else
      Store.latest.page params[:page]
    end
  end

  def new
    @store = Store.new
  end

  def create
    store = current_user.stores.new(@_params)
    if store.valid?
      store.save!
      redirect_to root_path
    end
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
    p '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@', @id, params[:store_id].to_i
    current_user.store(params[:store_id].to_i).delete if owner_signed_in?
    Store.find(params[:store_id].to_i).delete if admin_signed_in?
    redirect_to stores_path
  end

  private

  def store_id
    @id = params[:id]
  end

  def store_params
    @_params = params.require(:store).permit(:name, :image)
  end
end
