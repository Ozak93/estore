Rails.application.routes.draw do
  devise_for :users
  resources :stores
  resources :products
  resources :categories
  namespace :admins do
    get 'dashboard', as: 'dashboard', constraints: RoleRouteConstraint.new { |user| user.admin? }
  end
end
