require 'rails_helper'

RSpec.describe Visitor, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'valid with valid attributes' do
    visitor = create(:visitor)
    expect(visitor).to be_valid
  end

  it 'surname should be present' do
    visitor = build(:visitor, surname: nil)
    expect(visitor).to_not be_valid
  end

  it 'surname should be less than 50' do
    name = 'n' * 51
    visitor = build(:visitor, surname: name)
    expect(visitor).to_not be_valid
    expect(visitor.errors[:surname]).to include "too long, maximum is 50 characters"
  end

  it 'surname should be unique' do
    visitor1 = create(:visitor, surname: 'k1')
    visitor2 = build(:visitor, surname: 'k1')

    expect(visitor2).to_not be_valid
    expect(visitor2.errors[:surname]).to include('has already been taken')
  end

  it 'association with user is has_one' do
    assc = described_class.reflect_on_association(:users)
    expect(assc.macro).to eql :has_one
  end
end
