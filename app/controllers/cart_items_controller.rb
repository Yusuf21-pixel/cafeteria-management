class CartItemsController < ApplicationController
  def index
  end

  def create
    cart = Cart.find_by(user_id: @current_user.id)
    menu_item = MenuItem.find(params[:id])
    unless (cart.cart_items.find_by(menu_item_id: params[:id]))
      cart_item = CartItem.new(cart_id: cart.id,
                               menu_item_id: menu_item.id,
                               menu_item_name: menu_item.name,
                               menu_item_price: menu_item.price,
                               quantity: 1)
      unless (cart_item.save)
        flash[:error] = "Something went wrong"
      end
    end
    redirect_to users_menu_path(id: menu_item.menu_category_id)
  end

  def add_quantity
    cart = Cart.find_by(user_id: @current_user.id)
    cart_item = cart.cart_items.find(params[:id])
    cart_item.quantity += 1
    cart_item.save!
    redirect_to users_menu_path(id: 0), status: 303
  end

  def reduct_quantity
    cart = Cart.find_by(user_id: @current_user.id)
    cart_item = cart.cart_items.find(params[:id])
    unless (cart_item.quantity == 1)
      cart_item.quantity -= 1
      cart_item.save!
    end
    redirect_to users_menu_path(id: 0), status: 303
  end

  def delete_all
    cart = Cart.find_by(user_id: @current_user.id)
    cart_items = cart.cart_items
    cart_items.destroy_all
    redirect_to users_menu_path(id: 0), status: 303
  end

  def destroy
    cart = Cart.find_by(user_id: @current_user.id)
    cart_item = cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to users_menu_path(id: 0), status: 303
  end

  def checkout
    @cart = Cart.find_by(user_id: @current_user.id)
    @items = @cart.cart_items
    @addresses = @current_user.addresses.order(use_address: :desc)
  end
end
