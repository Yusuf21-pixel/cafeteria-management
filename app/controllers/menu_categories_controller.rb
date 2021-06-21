class MenuCategoriesController < ApplicationController
  def index
    @categories = MenuCategory.all
  end
end
