require 'rails_helper'

RSpec.describe "coders/edit", :type => :view do
  before(:each) do
    @coder = assign(:coder, Coder.create!(
      :coder_name => "MyString",
      :password_digest => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit coder form" do
    render

    assert_select "form[action=?][method=?]", coder_path(@coder), "post" do

      assert_select "input#coder_coder_name[name=?]", "coder[coder_name]"

      assert_select "input#coder_password_digest[name=?]", "coder[password_digest]"

      assert_select "input#coder_email[name=?]", "coder[email]"
    end
  end
end
