Rails.application.routes.draw do
  resources :products
  get "home/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # sets the root path to the home controller
  root to: "home#home"

  # Defines the root path route ("/")
  # root "articles#index"
end
