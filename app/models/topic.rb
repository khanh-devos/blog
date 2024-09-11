class Topic < ApplicationRecord
  belongs_to :author, class_name: "Admin"

  has_many :comments, dependent: :destroy, foreign_key: :topic_id

  # polymorphus with Like
  has_many :likes, as: :object, dependent: :destroy

  validates :author_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: {
    maximum: 2000,
    too_long: "maximum is %{count} characters"
  }
end
