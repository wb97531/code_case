require 'rails_helper'

RSpec.describe "coders/edit", :type => :view do
  before(:each) do
    @coder = assign(:coder, Coder.create!(
      :coder_name => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :email => "MyString@example.com"
    ))
  end

  it "renders the edit coder form" do
    render

    assert_select "form[action=?][method=?]", coder_path(@coder), "post" do

      assert_select "input#coder_coder_name[name=?]", "coder[coder_name]"

      assert_select "input#coder_password[name=?]", "coder[password]"

      assert_select "input#coder_password_confirmation[name=?]", "coder[password_confirmation]"

      assert_select "input#coder_email[name=?]", "coder[email]"
    end
  end
end
