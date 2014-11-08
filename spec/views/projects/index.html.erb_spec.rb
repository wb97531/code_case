require 'rails_helper'

RSpec.describe "projects/index", :type => :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :project_name => "Project Name",
        :github_link => "Github Link",
        :description => "MyText",
        :priority => 1,
        :user_id => 2,
        :current => false
      ),
      Project.create!(
        :project_name => "Project Name",
        :github_link => "Github Link",
        :description => "MyText",
        :priority => 1,
        :user_id => 2,
        :current => false
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Project Name".to_s, :count => 2
    assert_select "tr>td", :text => "Github Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
