require 'rails_helper'

RSpec.describe "coders/show", :type => :view do
  before(:each) do
    @coder = assign(:coder, Coder.create!(
      :coder_name => "Coder Name",
      :password => "MyString",
      :password_confirmation => "MyString",
      :email => "email@example.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Coder Name/)
    expect(rendered).to match(/Email/)
  end
end
