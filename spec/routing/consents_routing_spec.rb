require "rails_helper"

RSpec.describe ConsentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/consents").to route_to("consents#index")
    end

    it "routes to #new" do
      expect(:get => "/consents/new").to route_to("consents#new")
    end

    it "routes to #show" do
      expect(:get => "/consents/1").to route_to("consents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/consents/1/edit").to route_to("consents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/consents").to route_to("consents#create")
    end

    it "routes to #update" do
      expect(:put => "/consents/1").to route_to("consents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/consents/1").to route_to("consents#destroy", :id => "1")
    end

  end
end
