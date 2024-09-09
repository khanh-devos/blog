FactoryBot.define do
  factory :like do
    value { "true" }
    association :user
    association :object, factory: :topic
  end
end
