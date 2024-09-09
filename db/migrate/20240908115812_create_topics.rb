class CreateTopics < ActiveRecord::Migration[7.2]
  def change
    create_table :topics do |t|
      t.string :title, limit: 200, null: false
      t.string :img_url, limit: 200
      t.text :content, limit: 1000, null: false
      t.references :author, null: false, foreign_key: { to_table: 'admins' }

      t.timestamps
    end
  end
end
