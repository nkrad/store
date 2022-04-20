class ProfileController < ApplicationController
  def edit
    @user = current_user

    @addresses = @user.addresses

    @provinces = Province.all

    @orders = Order.where("user_id = ?", @user)

    @order_details = OrderDetail.where("user_id = ?", @user)
  end

  def new
    # deletes old address attached to user IF THERE IS ONE
    oldAddress = Address.where("user_id = ?", @user)

    oldAddress.delete(oldAddress)

    # creates a new address for the user
    address = Address.new
    address.fname = params[:fname]
    address.lname = params[:lname]
    address.street = params[:street]
    address.city = params[:city]
    address.province_id = params[:province_id]
    address.postalcode = params[:postalcode]
    address.user_id = current_user.id
    flash[:notice] = "➕ Address Updated"
    address.save

    redirect_back(fallback_location: root_path)
  end

  def remove
    address = Address.find(params[:id])

    flash[:notice] = "❌ Adress Removed"

    address.destroy

    redirect_back(fallback_location: root_path)
  end
end
