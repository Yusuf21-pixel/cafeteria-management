class MenuCategoriesController < ApplicationController
  def index
    @categories = MenuCategory.paginate(page: params[:page])
  end

  def create
    name = params[:category_name]
    new_category = MenuCategory.new(
      name: name,
      status: "active",
    )
    unless new_category.save
      flash[:error] = new_category.errors.full_messages.join(", ")
    end
    redirect_to menu_categories_path
  end

  def update
    category = MenuCategory.find(params[:id])
    category.status = params[:status]
    category.name = params[:category_name]
    category.save!
    redirect_to menu_categories_path
  end

  def destroy
    id = params[:id]
    category = MenuCategory.find(id)
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
