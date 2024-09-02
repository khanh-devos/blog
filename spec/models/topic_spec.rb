require 'rails_helper'

RSpec.describe Topic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it 'topic is valid with valid attributes' do
    topic = create(:topic)
    expect(topic).to be_valid
  end

  it 'title should be present' do
    topic = create(:topic, title: nil)
    expect(topic).to_not be_valid
  end

  it 'img_url should be present' do
    topic = create(:topic, img_url: nil)
    expect(topic).to_not be_valid
  end

  it 'content should be present' do
    topic = create(:topic, content: nil)
    expect(topic).to_not be_valid
  end

  it 'create users with 2 associated topics' do
    user = create(:user)
    create_list(:topic, 2, user: user)   # 2 topics associated with the user.
    expect(user.topics.count).to eq(2)
  end

end
