class CustomersController < ApplicationController
  def index
    @menu_category = MenuCategory.all
    @id = params[:id]
    if @id == "0"
      @category = MenuCategory.first
      redirect_to users_menu_path(id: @category.id) unless @category.nil?
    else
      @category = MenuCategory.find(@id)
    end
    @menu_items = @category.menu_items unless @category.nil?
    @cart_items = Cart.find_by(user_id: @current_user.id).cart_items.order(:id)
  end
end
