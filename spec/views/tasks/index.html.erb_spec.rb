require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :subject => "Subject",
        :assigne => "Assigne",
        :status => "Status",
        :description => "MyText",
        :created_by => "Created By"
      ),
      Task.create!(
        :subject => "Subject",
        :assigne => "Assigne",
        :status => "Status",
        :description => "MyText",
        :created_by => "Created By"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Assigne".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
  end
end
