require 'rails_helper'

RSpec.describe Like, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'valid with valid attributes ' do
    like = create(:like)
    expect(like).to be_valid
  end
  
  it 'value should be present' do
    like = create(:like, value: nil)
    expect(like).to_not be_valid
  end

  it 'value should be boolean' do
    like = create(:like, value: 'notboolean')
    expect(like).to_not be_valid
  end

  it 'belongs to topics' do
    topic = create(:topic)
    create_list(:like, 2, topic: topic)
    expect(topic.likes.count).to eq(2)
  end

  it 'belongs to user' do
    user = create(:user)
    create_list(:like, 2, user: user)
    expect(user.likes.count).to eq(2)
  end

end
