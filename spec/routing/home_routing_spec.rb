require "rails_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do

    it("routes to #index") { expect(:get => "/").to route_to("home#index") }
    it("routes to #categories") { expect(:get => "/explore").to route_to("home#categories") }
    it("routes to #districts") { expect(:get => "/natal-rn").to route_to("home#districts") }
    # it("routes to #district") { expect(:get => "/bairros/um").to route_to("home#district") }

  end
end
