require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @task1 = create(:task)
  end

  it 'is valid with valid attributes' do
    expect(@task1).to be_valid
  end
end
