FactoryBot.define do
  factory :user do
    email { "email123@gmail.com" }
    password { 'pass1Word#23' }
    association :function, factory: :visitor
  end
end
