require 'rails_helper'

RSpec.describe "coders/index", :type => :view do
  before(:each) do
    assign(:coders, [
      Coder.create!(
        :coder_name => "Coder Name",
        :password_digest => "Password Digest",
        :email => "Email"
      ),
      Coder.create!(
        :coder_name => "Coder Name",
        :password_digest => "Password Digest",
        :email => "Email"
      )
    ])
  end

  it "renders a list of coders" do
    render
    assert_select "tr>td", :text => "Coder Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
