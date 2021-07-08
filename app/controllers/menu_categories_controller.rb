class MenuCategoriesController < ApplicationController
  before_action :ensure_owner

  def index
    @categories = MenuCategory.all.order(:name)
  end

  def create_category
    new_category = MenuCategory.new(
      name: params[:category_name].capitalize(),
      status: "Active",
    )
    unless new_category.save
      flash[:error] = new_category.errors.full_messages.join(", ")
    end
    if params[:path] == "menu_category"
      redirect_to menu_categories_path
    else
      redirect_to menu_items_view_path(id: 0)
    end
  end

  def update
    category = MenuCategory.find(params[:id])
    category.status = params[:status]
    category.name = params[:category_name].capitalize()
    category.save!
    redirect_to menu_categories_path
  end

  def destroy
    category = MenuCategory.find(params[:id])
    category.destroy
    redirect_to menu_categories_path
  end

  def update_view
    @id = params[:id]
    @category = MenuCategory.find(@id)
  end

  def add_item_view
    @id = params[:id]
    @category_name = MenuCategory.find(@id).name
  end
end
