require "rails_helper"

RSpec.describe Admin::IssuesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/issues").to route_to("admin/issues#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/issues/new").to route_to("admin/issues#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/issues/1").to route_to("admin/issues#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/issues/1/edit").to route_to("admin/issues#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/issues").to route_to("admin/issues#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/issues/1").to route_to("admin/issues#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/issues/1").to route_to("admin/issues#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/issues/1").to route_to("admin/issues#destroy", :id => "1")
    end

  end
end
