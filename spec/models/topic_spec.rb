require 'rails_helper'

RSpec.describe Topic, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:admin) { create(:admin) }
  let!(:topic) { create(:topic, author: admin) }

  it 'valid with valid attributes' do
    expect(topic).to be_valid
  end

  it 'title should be present' do
    topic.title = nil
    expect(topic).to_not be_valid
    expect(topic.errors[:title]).to include("can't be blank")
  end

  it 'could have no img_url' do
    topic.img_url = nil
    expect(topic).to be_valid
  end

  it 'content should be present' do
    topic.content = nil
    expect(topic).to_not be_valid
    expect(topic.errors[:content]).to include("can't be blank")
  end

  it 'content should be less than 2000' do
    topic.content = 'a' * 2001
    expect(topic).to_not be_valid
    expect(topic.errors[:content]).to include("maximum is 2000 characters")
  end

  it 'associated many-to-one with Admin' do
    topic2 = create(:topic, author: admin)
    expect(admin.topics).to include(topic, topic2)
    expect(admin.topics.count).to eql(2)
  end
end
