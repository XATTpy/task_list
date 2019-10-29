require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @comment1 = create(:comment)
  end

  it 'is valid with tasks' do
    expect(@comment1).to be_valid
  end

  it 'is valid with comments' do
    comment2 = build(:comment, commentable: @comment1)
    expect(comment2).to be_valid
  end
end
