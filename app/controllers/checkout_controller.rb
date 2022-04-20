class CheckoutController < ApplicationController
  helper_method :cart
  helper_method :cart_subtotal
  helper_method :current_user_address

  # @user = current_user

  def receipt; end
end
