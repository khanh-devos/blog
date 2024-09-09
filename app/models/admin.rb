class Admin < ApplicationRecord
  enum :role, { owner: "owner", monitor: "monitor", client: "client" }
  enum :permission, { A: "A", B: "B", C: "C" }
  # A: full control
  # B: full control, exclude User
  # C: full control only over Comment, Like

  # one-one relationship
  has_one :users, as: :function, dependent: :destroy

  # many-to-one relationship with custom foreign_key
  has_many :topics, foreign_key: :author_id, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: {
    minimum: 4,
    maximum: 20,
    too_short: "too short, minimum is %{count} characters",
    too_long: "too long, maximum is %{count} characters"
  }

  validates :role, presence: true
  validates :permission, presence: true
end
