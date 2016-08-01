require 'rails_helper'

RSpec.describe "Cities", type: :request do
  describe "GET /admin/cities" do
    it "works! (now write some real specs)" do
      get admin_cities_path
      expect(response).to have_http_status(302)
    end
  end
end
