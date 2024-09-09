class Comment < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :topic, class_name: "Topic"

  # polymorphus with Like
  has_many :likes, as: :object, dependent: :destroy

  validates :content, presence: true
  validates :user_id, presence: true
  validates :topic_id, presence: true
end
