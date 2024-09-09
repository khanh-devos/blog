class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.text :content, limit: 500
      t.references :user, null: false, foreign_key: true, index: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
