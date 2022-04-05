class ApplicationController < ActionController::Base
  before_action :init_session
  helper_method :cart

  private

  def init_session
    session[:cart] ||= []
    session[:quantity] ||= [[]]
  end

  def cart
    Product.find(session[:cart])
  end
end
