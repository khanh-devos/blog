require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:topic) { create(:topic, author: admin) }
  let!(:comment) { create(:comment, user: user, topic: topic) }

  it 'valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'content should be present' do
    comment.content = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:content]).to include "can't be blank"
  end

  it 'topic should be present' do
    comment.topic = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:topic]).to include "must exist"
  end

  it 'user should be present' do
    comment.user = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:user]).to include "must exist"
  end

  it 'associated many-to-one with Topic' do
    comment2 = create(:comment, topic: topic, user: user)
    expect(topic.comments).to include(comment, comment2)
    expect(topic.comments.count).to eq(2)
  end

  it 'associated many-to-one with User' do
    comment2 = create(:comment, topic: topic, user: user)
    expect(user.comments).to include(comment, comment2)
    expect(user.comments.count).to eq(2)
  end
end
