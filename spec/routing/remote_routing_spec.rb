require "rails_helper"

RSpec.describe RemoteController, type: :routing do
  describe "routing" do

    it("routes to #categories") { expect(:get => "/remote/categories").to route_to("remote#categories") }
    it("routes to #districts") { expect(:get => "/remote/districts").to route_to("remote#districts") }

  end
end
