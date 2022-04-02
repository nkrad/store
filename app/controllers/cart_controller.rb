class CartController < ApplicationController
  def create
    id = params[:id].to_i

    unless session[:cart].include?(id)
      session[:cart] << id
      product = Product.find(id)
      flash[:notice] = "✔️#{product.name} was added to your cart."
      redirect_to root_path
    end
  end

  def destroy
    id = params[:id].to_i
    session[:cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "❌#{product.name} was removed from your cart."
    redirect_to root_path
  end
end
