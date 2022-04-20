class ApplicationController < ActionController::Base
  before_action :init_session
  helper_method :cart
  helper_method :cart_subtotal

  private

  def init_session
    session[:cart] ||= []
    session[:quantity] ||= []
    # keeps track of total price of all items in cart (item price x quanity)
    session[:cartSubtotal] ||= 0

    # only used in checkout controller
    session[:tax_rate] ||= 0
  end

  def cart
    Product.find(session[:cart])
  end

  def cart_subtotal
    price = 0
    cart.each do |product|
      price += product.price * session[:quantity][session[:cart].index(product.id)]
    end
    session[:cartSubtotal] = price
  end

  def current_user_address
    @addresses = current_user.addresses
  end
end
