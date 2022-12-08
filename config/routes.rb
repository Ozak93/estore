Rails.application.routes.draw do
  # Root path
  root to: "static_pages/home#index"

  # Dashboard path for admins and stores' owners.
  # get 'admins/dashboard', to: "admins/dashboard#index", as: 'admins_dashboard'
  # get 'owners/dashboard', to: 'owners/dashboard#index', as: 'owners_dashboard'

  # Resources paths for stores, products, and categories.
  resources :stores
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
    # namespace :users do
    #   get 'users/index'
    #   get 'user/index'
    # end
    # get 'users/index'
    # get 'customers/index'
    # get 'store_owners/index'
    get 'dashboard', as: 'dashboard', to: "dashboard#index"
    resources :users do
      get 'store_owners/page/:page', as: 'store_owners', to: "store_owners/store_owners#index", on: :collection
      get 'customers/page/:page', as: 'customers', to: "customers/customers#index", on: :collection
      get '/page/:page', as:'', to: 'users/users#index', on: :collection
    end
    # get 'users/store_owners/page/:page', as: 'users_store_owners', to: "store_owners/store_owners#index"
    # get 'users/customers/page/:page', as: 'users_customers', to: "customers/customers#index"
    # get 'users', as: 'users', to: 'users/users#index'
    resources :stores
    resources :products do
      get 'page/:page', to: 'products#index', on: :collection
    end
    resources :categories
  end
end
