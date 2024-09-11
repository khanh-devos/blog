class AddUserReferencesToAdminAndClient < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :admin, foreign_key: { to_table: 'admins' }
    add_reference :users, :visitor, foreign_key: { to_table: 'visitors' }
  end
end
