class AddressesController < ApplicationController
  def create
    new_address = params[:address].gsub(/[^0-9A-Za-z]/, "").downcase
    addresses = @current_user.addresses
    found = false
    addresses.each do |address|
      if (address.address.gsub(/[^0-9A-Za-z]/, "").downcase == new_address)
        found = true
      end
    end
    if (found)
      flash[:error] = "You have taken  already this Address"
    else
      location = Address.new(address: params[:address], user_id: @current_user.id, use_address: false)
      if addresses.empty?
        location.use_address = true
      end
      unless (location.save)
        flash[:error] = "Unable to create address"
      end
    end
    redirect_to checkout_path
  end

  def update
    update_address = @current_user.addresses.find(params[:id])
    update_address.address = params[:address]
    update_address.save!
    redirect_to checkout_path, status: 303
  end

  def destroy
    user_addresses = @current_user.addresses
    update_address = user_addresses.find(params[:id])
    update_address.destroy
    unless (user_addresses.empty?)
      last_address = user_addresses.last
      last_address.use_address = true
      last_address.save!
    end
    redirect_to checkout_path, status: 303
  end

  def update_use_address
    old_address = @current_user.addresses.find_by(use_address: true)
    old_address.use_address = false
    old_address.save!
    new_address = @current_user.addresses.find(params[:id])
    new_address.use_address = true
    new_address.save!
    redirect_to checkout_path, status: 303
  end

  def update_address_view
    @id = params[:id]
    @address = @current_user.addresses.find(@id).address
  end
end
