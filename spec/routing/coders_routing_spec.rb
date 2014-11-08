require "rails_helper"

RSpec.describe CodersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/coders").to route_to("coders#index")
    end

    it "routes to #new" do
      expect(:get => "/coders/new").to route_to("coders#new")
    end

    it "routes to #show" do
      expect(:get => "/coders/1").to route_to("coders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/coders/1/edit").to route_to("coders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/coders").to route_to("coders#create")
    end

    it "routes to #update" do
      expect(:put => "/coders/1").to route_to("coders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/coders/1").to route_to("coders#destroy", :id => "1")
    end

  end
end
