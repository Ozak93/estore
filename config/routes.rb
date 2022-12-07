Rails.application.routes.draw do
  # Root path
  root to: "static_pages/home#index"

  # Dashboard path for admins and stores' owners.
  # get 'admins/dashboard', to: "admins/dashboard#index", as: 'admins_dashboard'
  # get 'owners/dashboard', to: 'owners/dashboard#index', as: 'owners_dashboard'

  # Resources paths for stores, products, and categories.
  # resources :stores
  resources :products
  resources :categories

  # Devise generated paths for user controllers.
  devise_for :user, controllers: { sessions: 'users/sessions' }, skip: [:registrations]

  # Custom named path for user registrations path
  devise_scope :user do
    get '/sign_up', to: "users/registrations#new", as: 'new_customer_registration'
    get '/owner_sign_up', to: "users/registrations#new", as: 'new_owner_registration'
    post 'sign_up', to: "users/registrations#create", as: "user_registration"
  end
  namespace :owners do
    get 'dashboard', as: 'dashboard', to: 'dashboard#index'
  end
  # namespace :static_pages do
  #   get 'home/index'
  # end
  namespace :admins do
    get 'users/index'
    get 'customers/index'
    get 'store_owners/index'
    get 'dashboard', as: 'dashboard', to: "dashboard#index"
    get 'users/store_owners', as: 'users_store_owners', to: "store_owners#index"
    get 'users/customers', as: 'users_customers', to: "customers#index"
    get 'users', as: 'users', to: 'users#index'
    resources :stores
  end
end
