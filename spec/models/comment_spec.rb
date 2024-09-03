require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'valid with valid attributes' do
    comment = create(:comment)
    expect(comment).to be_valid
  end

  it 'content should be present' do
    comment = create(:comment, content: nil)
    expect(comment).to_not be_valid
  end

  it 'belongs to a topic' do
    topic = create(:topic)
    create_list(:comment, 2, topic: topic)
    expect(topic.comments.count).to eq(2)
  end

  it 'belongs to a user' do
    user = create(:user)
    create_list(:comment, 2, user: user)
    expect(user.comments.count).to eq(2)
  end
end
