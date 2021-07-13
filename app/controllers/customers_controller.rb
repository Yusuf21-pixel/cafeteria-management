class CustomersController < ApplicationController
  before_action :ensure_not_owner

  def index
    @menu_category = MenuCategory.all
    @id = params[:id]
    if @id == "0"
      @category = MenuCategory.find_by(status: "Active")
      redirect_to users_menu_path(id: @category.id) unless @category.nil?
    else
      @category = MenuCategory.find(@id)
    end
    @menu_items = @category.menu_items unless @category.nil?
    @cart = Cart.find_by(user_id: @current_user.id)
    @cart_items = @cart.cart_items.order(:id)
  end
end
