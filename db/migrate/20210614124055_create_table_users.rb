class CreateTableUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :role
      t.text :address
      t.string :phone_no
      t.timestamps
    end
  end
end
