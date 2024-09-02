FactoryBot.define do
  factory :topic do
    title {"rails spec"}
    img_url {"https://myimage"}
    content {"This is the content for topic 'rails content'. Please read."}
    association :user
  end
end
