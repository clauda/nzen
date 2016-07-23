require "rails_helper"

RSpec.describe ServicesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lojas-e-servicos").to route_to("services#index")
    end

    it "routes to #new" do
      expect(:get => "/anuncie").to route_to("services#new")
    end

    it "routes to #show" do
      expect(:get => "/nome-do-negocio").to route_to("services#show", :id => "nome-do-negocio")
    end

    it "routes to #edit" do
      expect(:get => "/services/1/edit").to route_to("services#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/services").to route_to("services#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/services/1").to route_to("services#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/services/1").to route_to("services#update", :id => "1")
    end

  end
end
