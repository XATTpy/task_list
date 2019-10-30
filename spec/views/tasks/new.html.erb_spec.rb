require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :subject => "MyString",
      :assigne => "MyString",
      :status => "MyString",
      :description => "MyText",
      :created_by => "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[subject]"

      assert_select "input[name=?]", "task[assigne]"

      assert_select "input[name=?]", "task[status]"

      assert_select "textarea[name=?]", "task[description]"

      assert_select "input[name=?]", "task[created_by]"
    end
  end
end
