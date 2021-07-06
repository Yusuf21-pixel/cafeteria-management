class RemoveCancelledAtFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :cancelled_at
  end
end
