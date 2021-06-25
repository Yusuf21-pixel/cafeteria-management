class MenuItemsController < ApplicationController
  def create
    item = MenuItem.new(name: params[:name].capitalize(),
                        price: params[:price],
                        description: params[:description].capitalize(),
                        menu_category_id: params[:category_id],
                        status: params[:status])
    unless item.save
      flash[:error] = item.errors.full_messages.join(", ")
    end
    redirect_to menu_categories_path
  end

  def render_items
    @menu_category = MenuCategory.all
    @id = params[:id]
    if @id == 0 && (!@menu_category.empty?)
      @category = MenuCategory.first
    else
      @category = MenuCategory.find(@id)
    end
    @menu_items = @category.menu_items
  end

  def update_view
    @id = params[:id]
    @item = MenuItem.find(@id)
  end

  def update
    item = MenuItem.find(params[:id])
    item.status = params[:status]
    item.name = params[:item_name].capitalize()
    item.price = params[:price]
    item.description = params[:description].capitalize()
    item.save!
    redirect_to menu_items_view_path(id: item.menu_category_id)
  end
end
