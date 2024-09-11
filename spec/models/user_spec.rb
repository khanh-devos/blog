require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ATTRIBUTES ONLY' do
    it 'valid with valid attributes' do
      user = create(:user)   # based on 'factory_bot_rails'
      expect(user).to be_valid
    end

    it 'can have different attributes' do
      user = build(:user, email: "jane@yahoo.com")
      expect(user.email).to eq("jane@yahoo.com")
    end

    it 'email should be present' do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it 'email should be unique' do
      existing_user = create(:user, email: 'unique@gmail.com')
      user = build(:user, email: 'unique@gmail.com')

      expect(user).to_not be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'function should be present' do
      user = build(:user, function: nil)
      expect(user).to_not be_valid
      expect(user.errors[:function]).to include('must exist')
    end

    it 'function could be admin or visitor' do
      visitor = create(:visitor)
      user = create(:user, function: visitor)
      expect(user.function).to eq(visitor)

      admin = create(:admin)
      user.function = admin
      expect(user.function).to eq(admin)
    end
  end

  context 'ASSOCIATIONS' do
    it 'should have many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it 'should have many likes' do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end
  end
end
