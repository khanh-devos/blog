require 'rails_helper'

RSpec.describe Like, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:topic) { create(:topic, author: admin) }
  let!(:comment) { create(:comment, user: user, topic: topic) }
  let!(:like) { create(:like, user: user, object: topic) }

  it 'valid with valid attributes' do
    expect(like).to be_valid
  end

  it 'value should be present' do
    like.value = nil
    expect(like).to_not be_valid
    expect(like.errors[:value]).to include "can't be blank"
  end

  it 'value should be boolean' do
    like.value = 'notboolean'
    expect(like.value).to_not eql('notboolean')
    expect(like.value).to eql(true)   # auto convert to boolean
  end

  it 'belongs to topics' do
    like2 = create(:like, user: user, object: topic)
    expect(topic.likes).to include(like, like2)
    expect(topic.likes.count).to eq(2)
  end

  it 'object could be [comment topic]' do
    expect(like.object).to eq(topic)
    like.object = comment
    expect(like.object).to eq(comment)
  end

  it 'belongs to user' do
    like2 = create(:like, user: user, object: topic)
    expect(user.likes).to include(like, like2)
    expect(user.likes.count).to eq(2)
  end
end
