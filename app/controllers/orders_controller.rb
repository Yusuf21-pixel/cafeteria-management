class OrdersController < ApplicationController
  def create
    cart_items = Cart.find_by(user_id: @current_user.id).cart_items
    order = Order.new(date: DateTime.now(),
                      user_id: @current_user.id,
                      address: @current_user.addresses.find_by(use_address: true).address,
                      phone_no: @current_user.phone_no)
    if (order.save)
      cart_items.each do |cart_item|
        order_item = OrderItem.new(order_id: order.id,
                                   menu_item_name: cart_item.menu_item_name,
                                   menu_item_price: cart_item.menu_item_price,
                                   quantity: cart_item.quantity)
        order_item.save!
      end
      cart_items.destroy_all
    else
      flash[:error] = "Unable to place order"
    end
    redirect_to users_menu_path(id: 0)
  end
end
