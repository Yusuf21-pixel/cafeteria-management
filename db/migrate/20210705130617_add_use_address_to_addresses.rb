class AddUseAddressToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :use_address, :boolean
  end
end
