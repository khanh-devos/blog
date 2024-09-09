class AddUniqueVisitorSurname < ActiveRecord::Migration[7.2]
  def change
    add_index :visitors, :surname, unique: true
  end
end
