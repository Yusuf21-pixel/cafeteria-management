class AddDateAndTimeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :date, :date
    add_column :orders, :time, :string
  end
end
