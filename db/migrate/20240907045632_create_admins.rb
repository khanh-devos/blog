class CreateAdmins < ActiveRecord::Migration[7.2]
  def change
    create_enum :user_roles, %w[owner monitor client]
    create_enum :user_permissions, %w[A B C]
    # A: full control
    # B: full control, exclude User
    # C: full control only over Comment, Like

    create_table :admins do |t|
      t.string :username, limit: 100, null: false
      t.enum :role, null: false, enum_type: :user_roles, default: 'client'
      t.enum :permission, null: false, enum_type: :user_permissions, default: 'C'


      t.timestamps
    end

    add_index :admins, :username, unique: true, name: 'unique_username'
  end
end
