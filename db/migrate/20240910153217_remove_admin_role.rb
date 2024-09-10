class RemoveAdminRole < ActiveRecord::Migration[7.2]
  def change
    change_column :admins, :role, :string

    execute <<-SQL
      DROP TYPE IF EXISTS user_roles CASCADE;
    SQL
  end
end
