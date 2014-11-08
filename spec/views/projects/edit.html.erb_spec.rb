require 'rails_helper'

RSpec.describe "projects/edit", :type => :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :project_name => "MyString",
      :github_link => "MyString",
      :description => "MyText",
      :priority => 1,
      :user_id => 1,
      :current? => false
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_project_name[name=?]", "project[project_name]"

      assert_select "input#project_github_link[name=?]", "project[github_link]"

      assert_select "textarea#project_description[name=?]", "project[description]"

      assert_select "input#project_priority[name=?]", "project[priority]"

      assert_select "input#project_user_id[name=?]", "project[user_id]"

      assert_select "input#project_current?[name=?]", "project[current?]"
    end
  end
end
