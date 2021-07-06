class AddColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :address, :text
    add_column :orders, :phone_no, :string
  end
end
