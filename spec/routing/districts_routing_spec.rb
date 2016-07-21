require "rails_helper"

RSpec.describe Admin::DistrictsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/districts").to route_to("admin/districts#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/districts/new").to route_to("admin/districts#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/districts/1").to route_to("admin/districts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/districts/1/edit").to route_to("admin/districts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/districts").to route_to("admin/districts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/districts/1").to route_to("admin/districts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/districts/1").to route_to("admin/districts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/districts/1").to route_to("admin/districts#destroy", :id => "1")
    end

  end
end
