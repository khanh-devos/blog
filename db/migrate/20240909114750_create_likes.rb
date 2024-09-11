class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.boolean :value, null: false
      t.references :user, null: false, foreign_key: true
      t.references :object, polymorphic: true, null: false, index: true

      t.timestamps
    end
  end
end
