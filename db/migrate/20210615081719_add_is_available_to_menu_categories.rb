class AddIsAvailableToMenuCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_categories, :is_available, :boolean
  end
end
