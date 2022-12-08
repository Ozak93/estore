module NavBar
  extend ActiveSupport::Concern
  included do
    before_action :admin_signed_in?, only: [:nav_stores]
    helper_method :nav_stores
    helper_method :user_store_path
    helper_method :user_stores_path
  end

  protected

  def nav_stores
    @_store_batch = Store.top_five
  end

  def user_store_path(store)
    store_path(store) unless user_signed_in? and current_user.customer?
    path = case current_user.role
           when 'admin'
             admins_store_path(store)
           else
             owners_store_path(store)
           end
  end

  def user_stores_path
    stores_path unless user_signed_in? and current_user.customer?
    path = case current_user.role
           when 'admin'
             admins_stores_path
           else
             owners_stores_path

           end
  end

end
