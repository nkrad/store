class CartController < ApplicationController
  # adding to cart
  def create
    id = params[:id].to_i

    # default quantity is 1
    quantity = params[:quantity].to_i

    unless session[:cart].include?(id)
      session[:cart] << id
      # session[:quantity] << id
      session[:quantity][session[:cart].index(id)] = quantity

      product = Product.find(id)
      flash[:notice] = "✔️#{product.name} was added to your cart."
      redirect_to root_path
    end
  end

  # removing from cart
  def destroy
    id = params[:id].to_i

    session[:quantity].delete_at(session[:cart].index(id))
    session[:cart].delete(id)

    product = Product.find(id)
    flash[:notice] = "❌#{product.name} was removed from your cart."
    redirect_to root_path
  end

  def show
    @cart = session[:cart]
    @quantity = session[:quantity]
    @products = Product.find(@cart)
  end
end
