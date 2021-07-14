class AddArchivedByToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :archived_by, :boolean
  end
end
