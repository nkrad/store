class ProfileController < ApplicationController
  def edit
    @user = current_user

    @addresses = @user.addresses

    @provinces = Province.all
  end

  def new
    address = Address.new

    address.fname = params[:fname]
    address.lname = params[:lname]
    address.street = params[:street]
    address.city = params[:city]
    address.province_id = params[:province_id]
    address.postalcode = params[:postalcode]
    address.user_id = current_user.id

    flash[:notice] = "➕ New Address Added"

    address.save

    redirect_back(fallback_location: root_path)
  end

  def remove
    addressToRemove = Address.find(:id)

    redirect_back(fallback_location: root_path)
  end
end
