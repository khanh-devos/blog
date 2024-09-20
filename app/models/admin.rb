class Admin < ApplicationRecord
  enum :permission, {
    Full_control_on_Topic: "Full_control_on_Topic",
    Full_control_on_Comment_or_Like: "Full_control_on_Comment_or_Like"
  }

  # one-one relationship
  has_one :user, as: :function, dependent: :destroy
  accepts_nested_attributes_for :user

  # many-to-one relationship with custom foreign_key
  has_many :topics, foreign_key: :author_id, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: {
    minimum: 4,
    maximum: 20,
    too_short: "too short, minimum is %{count} characters",
    too_long: "too long, maximum is %{count} characters"
  }

  validates :permission, presence: true

  # You can also define helper methods for readability
  def can_control_topic?
    permission == "Full_control_on_Topic"
  end

  def can_control_comments_or_likes?
    permission == "Full_control_on_Comment_or_Like"
  end
end
