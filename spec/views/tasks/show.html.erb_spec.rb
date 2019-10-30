require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :subject => "Subject",
      :assigne => "Assigne",
      :status => "Status",
      :description => "MyText",
      :created_by => "Created By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Assigne/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Created By/)
  end
end
