class AddUniqueToVisitorsUser < ActiveRecord::Migration[7.2]
  def change
    add_index :visitors, :user_id, unique: true, name: 'unique_user'
  end
end
