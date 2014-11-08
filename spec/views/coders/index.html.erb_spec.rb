require 'rails_helper'

RSpec.describe "coders/index", :type => :view do
  before(:each) do
    assign(:coders, [
      Coder.create!(
        :coder_name => "First Coder Name",
        :password => "Password Digest",
        :password_confirmation => "Password Digest",
        :email => "first_email@example.com"
      ),
      Coder.create!(
        :coder_name => "Second Coder Name",
        :password => "Password Digest",
        :password_confirmation => "Password Digest",
        :email => "second_email@example.com"
      )
    ])
  end

  it "renders a list of coders" do
    render
    assert_select "tr>td", :text => "First Coder Name".to_s, :count => 1
    assert_select "tr>td", :text => "Second Coder Name".to_s, :count => 1
    assert_select "tr>td", :text => "first_email@example.com".to_s, :count => 1
    assert_select "tr>td", :text => "second_email@example.com".to_s, :count => 1

  end
end
