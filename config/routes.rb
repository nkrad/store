Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products

  # sets the root path to the home controller
  get "home/home"
  root to: "home#home"

  resources :cart, only: %i[create destroy]

  # change to post
  # get "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  # post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"

  # delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"

  # taken from intro project, doesnt work
  resources :products, only: %i[home show] do
    collection do
      get "search"
    end
  end
end
