class DeleteAdminRole < ActiveRecord::Migration[7.2]
  def change
    remove_column :admins, :role
  end
end
