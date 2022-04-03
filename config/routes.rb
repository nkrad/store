Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products

  # sets the root path to the home controller
  get "home/home"
  root to: "home#home"

  resources :cart, only: [:create, :destroy]

  # taken from intro project, doesnt work
  resources :products, only: %i[home show] do
    collection do
      get "search"
    end
  end
end
