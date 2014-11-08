require 'rails_helper'

RSpec.describe "Coders", :type => :request do
  describe "GET /coders" do
    it "works! (now write some real specs)" do
      get coders_path
      expect(response).to have_http_status(200)
    end
  end
end
