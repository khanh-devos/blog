class ChangeUserEnum < ActiveRecord::Migration[7.2]
  def up
    # First, change the column type that is using the enum
    change_column :admins, :role, :string
    change_column :admins, :permission, :string

    # Drop the enum type
    execute <<-SQL
      DROP TYPE IF EXISTS user_roles CASCADE;
      DROP TYPE IF EXISTS user_permissions CASCADE;
    SQL
  end
end
