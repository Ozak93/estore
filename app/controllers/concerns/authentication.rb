module Authentication
  extend ActiveSupport::Concern
  included do
    helper_method :admin_signed_in?
    helper_method :owner_signed_in?
    helper_method :customer_signed_in?
    helper_method :user_home_path
  end

  protected

  def admin_signed_in?
    user_signed_in? ? current_user.role == 'admin' : false
  end

  def owner_signed_in?
    user_signed_in? ? current_user.role == 'owner' : false
  end

  def customer_signed_in?
    user_signed_in? ? current_user.role == 'customer' : false
  end

  def authenticate_admin_or_owner!
    puts '==========================>', admin_signed_in?, '<=============================='
    redirect_to root_path unless admin_signed_in? or owner_signed_in?
  end
  def redirect_to_after_sign_in_path
    path = case current_user&.role
           when 'admin'
             admin_dashboard_path(1)
           when 'owner'
             owners_dashboard_path
           else
             root_path
           end
    redirect_to path and return
  end

  def user_home_path
    case current_user&.role
    when 'admin'
      admin_dashboard_path(1)
    when 'owner'
      owners_dashboard_path
    else
      root_path
    end
  end

end
