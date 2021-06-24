class RemoveIsAvailableFromMenuCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_categories, :is_available
  end
end
