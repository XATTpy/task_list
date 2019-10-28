require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @task1 = create(:task)
  end

  it "is valid with valid attributes" do
    expect(@task1).to be_valid
  end

  it "is not valid without admin" do
    task2 = build(:task, admin_id: 55555)
    expect(task2).to_not be_valid
  end
end
