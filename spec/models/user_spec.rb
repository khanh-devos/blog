require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it 'user is valid with valid attributes' do
    user = create(:user)   # based on 'factory_bot_rails'
    expect(user).to be_valid
  end

  it 'can have different attributes' do
    user = create(:user, name: "Jane Doe")
    expect(user.name).to eq("Jane Doe")
  end

  it 'user email should be present' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end


  it 'should have many topics' do
    assc = described_class.reflect_on_association(:topics)
    expect(assc.macro).to eql :has_many
  end

  it 'should have many comments' do
    assc = described_class.reflect_on_association(:comments)
    expect(assc.macro).to eq :has_many
  end

  it 'should have many likes' do
    assc = described_class.reflect_on_association(:likes)
    expect(assc.macro).to eq :has_many
  end
end
