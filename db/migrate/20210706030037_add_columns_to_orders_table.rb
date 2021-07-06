class AddColumnsToOrdersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :archived_by, :string
    add_column :orders, :cancelled_at, :datetime
  end
end
