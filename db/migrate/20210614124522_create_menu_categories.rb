class CreateMenuCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_categories do |t|
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
