class AddColumnsToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :quantity, :int
    add_column :cart_items, :tot_item_price, :float
  end
end
