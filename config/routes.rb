Rails.application.routes.draw do
  get "category/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products

  # sets the root path to the home controller
  get "home/home"
  root to: "home#home"

  resources :cart, only: %i[create destroy]

  resources :category, only: %i[index show]

  # taken from intro project, doesnt work
  resources :products, only: %i[home show] do
    collection do
      get "search"
    end
  end
end
