class OrdersController < ApplicationController
  def create
    cart_items = Cart.find_by(user_id: @current_user.id).cart_items
    order = Order.new(date: DateTime.now().to_date,
                      time: Time.now().strftime("%I:%M%p"),
                      user_id: @current_user.id,
                      address: (@current_user.role == "clerk") ? "walk-in-customer" : @current_user.addresses.find_by(use_address: true).address,
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

  def customer_order
  end

  def cancel_order
    if (@current_user.role == "customer")
      order = @current_user.orders.find(params[:id])
    else
      order = Order.find(params[:id])
    end
    if (order.archived_by.nil?)
      order.archived_by = @current_user.role
      order.save!
    end
    redirect_to customer_orders_path
  end

  def index
    @order_detail = Order.find(params[:id])
  end

  def update_pending_order
    order = Order.find(params[:id])
    if (order.archived_by.nil? && order.delivered_at.nil?)
      order.delivered_at = DateTime.now()
      order.save!
    end
    redirect_to customer_orders_path
  end
end
