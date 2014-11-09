require 'rails_helper'

RSpec.describe "coders/new", :type => :view do
  before(:each) do
    assign(:coder, Coder.new(
      :coder_name => "MyString",
      :password_digest => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new coder form" do
    render

    assert_select "form[action=?][method=?]", coders_path, "post" do

      assert_select "input#coder_coder_name[name=?]", "coder[coder_name]"

      assert_select "input#coder_password[name=?]", "coder[password]"

      assert_select "input#coder_password_confirmation[name=?]", "coder[password_confirmation]"


      assert_select "input#coder_email[name=?]", "coder[email]"
    end
  end
end
