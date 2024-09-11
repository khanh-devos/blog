class SetUserReferencePolymorphic < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :admin_id
    remove_column :users, :visitor_id
    add_reference :users, :function, polymorphic: true, index: true
  end
end
