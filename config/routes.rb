Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  get "home/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # sets the root path to the home controller
  root to: "home#home"

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products, only: %i[index show] do
    collection do
      get "search"
    end
  end


end
