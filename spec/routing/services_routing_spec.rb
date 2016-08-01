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

  end
end
