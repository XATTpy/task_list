require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user1).to be_valid
  end

  it 'is not valid without valid email' do
    user2 = build(:user, email: 'test')
    expect(user2).to_not be_valid
  end

  it 'is not valid without valid password' do
    user2 = build(:user, password: '123', email: 'test@test.com')
    expect(user2).to_not be_valid
  end

  it 'is generate username' do
    expect(@user1.username).to eq 'Dio'
  end

  it 'is not valid when email is already taken' do
    user2 = build(:user)
    expect(user2).to_not be_valid
  end
end
