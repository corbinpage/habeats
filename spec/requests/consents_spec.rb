require 'rails_helper'

RSpec.describe "Consents", :type => :request do
  describe "GET /consents" do
    it "works! (now write some real specs)" do
      get consents_path
      expect(response).to have_http_status(200)
    end
  end
end
