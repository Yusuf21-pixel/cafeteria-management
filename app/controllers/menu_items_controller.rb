class MenuItemsController < ApplicationController
  def create
    item = MenuItem.new(name: params[:name],
                        price: params[:price],
                        description: params[:description],
                        menu_category_id: params[:category_id],
                        status: params[:status])
    unless item.save
      flash[:error] = item.errors.full_messages.join(", ")
    end
    redirect_to menu_categories_path
  end
end
