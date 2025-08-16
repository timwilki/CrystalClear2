require 'rails_helper'

RSpec.describe "Application Layout", type: :request do
  describe "layout elements" do
    it "displays the header with title" do
      get root_path
      expect(response.body).to include("Birth Stone Finder")
      expect(response.body).to include("Discover your birth stone and learn about its magical properties")
    end

    it "displays the footer" do
      get root_path
      expect(response.body).to include("Birth Stone Finder. Discover the magic within.")
    end

    it "includes the main content container" do
      get root_path
      expect(response.body).to include('class="main-content"')
      expect(response.body).to include('class="container"')
    end

    it "includes the application stylesheet" do
      get root_path
      expect(response.body).to include('application-')
      expect(response.body).to include('.css')
    end
  end
end
