class RemoveDateFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :date
  end
end
