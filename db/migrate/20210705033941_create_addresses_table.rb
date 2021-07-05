class CreateAddressesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.text :addresses
      t.bigint :user_id
      t.timestamps
    end
  end
end
