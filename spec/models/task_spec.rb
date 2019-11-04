require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @user1 = create(:user, email: 'test@gmail.com')
    @task1 = create(:task)
  end

  it 'is valid with valid attributes' do
    expect(@task1).to be_valid
  end

  it 'is set up user reference when create' do
    expect(@task1.user).to eq @user1
  end

  it 'is not valid without subject' do
    task2 = build(:task, subject: nil)
    expect(task2).to_not be_valid
  end
end
