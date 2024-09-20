class Visitor < ApplicationRecord
  validates :surname, presence: true, uniqueness: true, length: {
    maximum: 50,
    too_long: "too long, maximum is %{count} characters"
  }

  has_one :user, as: :function, dependent: :destroy
  accepts_nested_attributes_for :user
end
