class CheckoutController < ApplicationController
  helper_method :cart
  helper_method :cart_subtotal
  helper_method :current_user_address

  # @user = current_user

  def receipt
    flash[:notice] = "➕ Order Placed!"

    # create new order
    order = Order.new
    order.user_id = current_user.id
    order.subtotal = cart_subtotal
    order.tax = (session[:tax_rate] * cart_subtotal).round(2)
    order.grand_total = (cart_subtotal + (session[:tax_rate].round(2) * cart_subtotal)).round(2)
    order.address_id = Address.where("user_id = ?", current_user.id).first.id
    order.save

    # create new order_details for each product in cart
    cart.each do |product|
      order_detail = OrderDetail.new
      # same order id as above
      order_detail.order_id = order.id
      order_detail.user_id = current_user.id
      order_detail.product_id = product.id
      order_detail.quantity = session[:quantity][session[:cart].index(product.id)]
      order_detail.save
    end

    # empty cart and clear quantites
    session[:quantity] = []
    session[:cart] = []
    session[:tax_rate] = 0

    # redirect_back(fallback_location: root_path)
  end
end
