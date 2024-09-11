class Like < ApplicationRecord
  belongs_to :user, class_name: "User"

  # polymorphic with model Comment or Topic
  belongs_to :object, polymorphic: true

  validates :value, :user_id, :object_id, presence: true
end
