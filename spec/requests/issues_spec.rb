require 'rails_helper'

RSpec.describe "Issues", type: :request do
  describe "GET /admin/issues" do
    it "works! (now write some real specs)" do
      get admin_issues_path
      expect(response).to have_http_status(302)
    end
  end
end
