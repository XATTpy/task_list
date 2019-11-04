require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = create(:user, email: 'comm@com.com')
    @task = create(:task, assignee: 'Comm')
    @comment1 = create(:comment, commentable: @task)
  end

  it 'is valid with tasks' do
    expect(@comment1).to be_valid
  end

  it 'is valid with comments' do
    comment2 = build(:comment, commentable: @comment1)
    expect(comment2).to be_valid
  end

  it 'is not valid without text' do
    comment2 = build(:comment, text: nil)
    expect(comment2).to_not be_valid
  end
end
