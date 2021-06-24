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
  end
end
