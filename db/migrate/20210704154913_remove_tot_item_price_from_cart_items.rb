class RemoveTotItemPriceFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :tot_item_price
  end
end
