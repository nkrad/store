class CartController < ApplicationController
  # adding to cart
  def create
    id = params[:id].to_i

    # default quantity is 1, see product view
    quantity = params[:quantity].to_i

    unless session[:cart].include?(id)
      session[:cart] << id
      # session[:quantity] << id

      # sets the quantity to param[quantity] at index of product id
      session[:quantity][session[:cart].index(id)] = quantity

      product = Product.find(id)
      flash[:notice] = "✔️#{product.name} was added to your cart."
      redirect_back(fallback_location: root_path)
    end
  end

  # removing from cart
  def destroy
    id = params[:id].to_i

    session[:quantity].delete_at(session[:cart].index(id))
    session[:cart].delete(id)

    product = Product.find(id)
    flash[:notice] = "❌#{product.name} was removed from your cart."
    redirect_back(fallback_location: root_path)
  end

  # updating cart quantity
  def update
    id = params[:id].to_i
    quantity = params[:quantity].to_i

    product = Product.find(id)

    session[:quantity][session[:cart].index(id)] = quantity
    flash[:notice] = "➕#{product.name}'s quantity was updated."
    redirect_back(fallback_location: root_path)
  end

  def show
    @cart = session[:cart]
    @quantity = session[:quantity]
    @products = Product.find(@cart)
  end
end
