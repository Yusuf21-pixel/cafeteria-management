class RemoveDateFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :date
  end
end
