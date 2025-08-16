require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "displays the birth date form" do
      get root_path
      expect(response.body).to include("Discover Your Birth Stone")
      expect(response.body).to include("Birth Month")
      expect(response.body).to include("Birth Day")
      expect(response.body).to include("Find My Birth Stone")
    end

    it "has proper form action" do
      get root_path
      expect(response.body).to include('action="/birth-stone"')
    end
  end
end
