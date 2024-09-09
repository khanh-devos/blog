class CreateVisitors < ActiveRecord::Migration[7.2]
  def change
    create_table :visitors do |t|
      t.string :surname, limit: 100, null: false
      t.string :lastname, limit: 100
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
