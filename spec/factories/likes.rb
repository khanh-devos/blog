FactoryBot.define do
  factory :like do
    value {"true"}
    association :user
    association :topic
  end
end
