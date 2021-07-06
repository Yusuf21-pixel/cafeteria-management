class RemoveMenuItemIdFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :menu_item_id
  end
end
