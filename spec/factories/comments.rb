FactoryBot.define do
  factory :comment do
    content { "this is a comment from user on the topic" }
    association :user
    association :topic
  end
end
