module NavBar
  extend ActiveSupport::Concern
  included do
    before_action :admin_signed_in?, only: [:nav_stores]
    helper_method :nav_stores
  end


  protected

  def nav_stores
    @_store_batch = Store.top_five
  end
end
