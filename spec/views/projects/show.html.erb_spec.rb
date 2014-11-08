require 'rails_helper'

RSpec.describe "projects/show", :type => :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :project_name => "Project Name",
      :github_link => "Github Link",
      :description => "MyText",
      :priority => 1,
      :user_id => 2,
      :current? => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Project Name/)
    expect(rendered).to match(/Github Link/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
