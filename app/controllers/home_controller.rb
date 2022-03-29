class HomeController < ApplicationController
  def home
    @products = Product.all.order("designer DESC").limit(25)
  end
end
