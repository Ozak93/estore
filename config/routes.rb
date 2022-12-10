Rails.application.routes.draw do
  # Root path
  root to: "static_pages/home#index"

  # Resources paths for stores, products, and categories.
  resources :stores do
    get '/page/:page', as: 'stores', to: 'stores#index', on: :collection
    get '/:id', as: 'store', to: 'stores#show'
  end
  resources :products do
    get '/page/:page', as: 'products', to: 'products#index', on: :collection
    get '/:id', as: 'product', to:  'products#show'
    # post '/', as: 'new_product', to: 'products#create'
  end
  resources :categories do
    get '/page/:page', as: 'categories', to: 'categories#index', on: :collection
    get '/:id', as: 'category', to:  'categories#show'
  end

  scope :cart do
    get '/', as: 'cart', to: 'cart#index'
    post '/', as: 'add_to_cart', to: 'cart#update'
  end

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


  resources :users do
    get 'store_owners/page/:page', as: 'store_owners', to: 'users/users#index', on: :collection
    get 'customers/page/:page', as: 'customers', to: "customers/customers#index", on: :collection
    get '/page/:page', as:'', to: 'users/users#index', on: :collection
  end

  namespace :admins do
    get 'dashboard', as: 'dashboard', to: "admins/dashboard#index"
  end
end
