class AddColumnToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :quantity, :int
  end
end
