require 'rails_helper'

RSpec.describe "Services", type: :request do
  describe "GET /admin/services" do
    it "works! (now write some real specs)" do
      get admin_services_path
      expect(response).to have_http_status(302)
    end
  end
end
