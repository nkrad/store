class HomeController < ApplicationController
  def home
    @products = Product.page params[:page]
  end
end
