FactoryBot.define do
  factory :comment do
    content { "factorybotrails comment" }
    association :user
    association :topic
  end
end
