require 'rails_helper'

RSpec.describe "Districts", type: :request do
  describe "GET /districts" do
    it "works! (now write some real specs)" do
      get admin_districts_path
      expect(response).to have_http_status(302)
    end
  end
end
