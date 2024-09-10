class BuildUserEnum < ActiveRecord::Migration[7.2]
  def change
    # Re-create the enum type if needed
    create_enum :user_roles, %w[writer remover]
    create_enum :user_permissions, %w[Full_control_on_Topic Full_control_on_Comment_or_Like]


    # Change the column back to the enum type
    remove_column :admins, :role
    remove_column :admins, :permission

    add_column :admins, :role, :user_roles, null: false, default: :remover
    add_column :admins, :permission, :user_permissions, null: false, default: :Full_control_on_Comment_or_Like
  end
end
