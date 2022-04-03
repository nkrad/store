Rails.application.routes.draw do
  get "category/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products

  # sets the root path to the home controller
  get "home/home"

  get "search", to: "products#search"
  root to: "home#home"

  resources :cart, only: %i[create destroy]

  resources :category, only: %i[index show]
end
