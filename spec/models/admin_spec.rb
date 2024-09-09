require 'rails_helper'

RSpec.describe Admin, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:admin) { create(:admin) }

  context 'ATTRIBUTES ONLY' do
    it 'valid with valid attributes' do
      expect(admin).to be_valid
    end

    it 'role should be present' do
      admin.role = nil
      expect(admin).to_not be_valid
    end

    it 'role should be among [owner monitor client]' do
      expect(described_class.roles.keys).to include('owner', 'monitor', 'client')
    end

    it 'permission should be present' do
      admin.permission = nil
      expect(admin).to_not be_valid
      expect(admin.errors[:permission]).to include("can't be blank")
    end
  end

  context 'USERNAME' do
    it 'username should be present' do
      admin.username = nil
      expect(admin).to_not be_valid
      expect(admin.errors["username"]).to include("can't be blank")
    end

    it 'username should be longer than 4' do
      admin.username = 'k1'
      expect(admin).to_not be_valid
      expect(admin.errors[:username]).to include "too short, minimum is 4 characters"
    end

    it 'username should be less than 20' do
      admin.username = '123456789012345678901'
      expect(admin).to_not be_valid
      expect(admin.errors[:username]).to include "too long, maximum is 20 characters"
    end

    it 'username should be unique' do
      admin.username = "k123"
      admin.save

      admin2 = build(:admin, username: 'k123')
      expect(admin2).to_not be_valid
      expect(admin2.errors["username"]).to include('has already been taken')
    end
  end

  context 'ASSOCIATION' do
    it 'permission should be among ["A", "B", "C"]' do
      expect(described_class.permissions.keys).to include('A', 'B', 'C')
    end

    it 'association with user is has_one' do
      assc = described_class.reflect_on_association(:users)
      expect(assc.macro).to eql :has_one
    end

    it 'association with topic is has_many' do
      assc = described_class.reflect_on_association(:topics)
      expect(assc.macro).to eql :has_many
    end
  end
end
