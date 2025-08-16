require 'rails_helper'

RSpec.describe "BirthStones", type: :request do
  describe "POST /birth-stone" do
    it "redirects with valid parameters" do
      post birth_stone_path, params: { month: 1, day: 15 }
      expect(response).to have_http_status(:redirect)
    end

    it "redirects to birth stone show page with valid month" do
      post birth_stone_path, params: { month: 1, day: 15 }
      expect(response).to redirect_to(birth_stone_show_path(month: 1))
    end

    it "redirects to birth stone show page with valid month 12" do
      post birth_stone_path, params: { month: 12, day: 31 }
      expect(response).to redirect_to(birth_stone_show_path(month: 12))
    end

    it "redirects to home with error for invalid month" do
      post birth_stone_path, params: { month: 13, day: 15 }
      expect(response).to redirect_to(root_path)
    end

    it "redirects to home with error for invalid day" do
      post birth_stone_path, params: { month: 1, day: 32 }
      expect(response).to redirect_to(root_path)
    end

    it "redirects to home with error for zero month" do
      post birth_stone_path, params: { month: 0, day: 15 }
      expect(response).to redirect_to(root_path)
    end

    it "redirects to home with error for zero day" do
      post birth_stone_path, params: { month: 1, day: 0 }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET /birth-stone/:month" do
    before do
      # Create a birth stone for testing
      BirthStone.create!(
        month: "January",
        crystal: "Garnet",
        colour: "Red",
        origin: "India, China, USA",
        properties: "Energy, Health, Wellbeing",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
    end

    it "returns http success for valid month" do
      get birth_stone_show_path(month: 1)
      expect(response).to have_http_status(:success)
    end

    it "displays birth stone information" do
      get birth_stone_show_path(month: 1)
      expect(response.body).to include("Your Birth Stone: Garnet")
      expect(response.body).to include("Garnet")
      expect(response.body).to include("Red")
      expect(response.body).to include("India, China, USA")
      expect(response.body).to include("Energy, Health, Wellbeing")
    end

    it "displays navigation buttons" do
      get birth_stone_show_path(month: 1)
      expect(response.body).to include("Try Another Date")
      expect(response.body).to include("Learn More About Birth Stones")
    end

    it "redirects to home for invalid month (0)" do
      get birth_stone_show_path(month: 0)
      expect(response).to redirect_to(root_path)
    end

    it "redirects to home for invalid month (13)" do
      get birth_stone_show_path(month: 13)
      expect(response).to redirect_to(root_path)
    end

    it "redirects to home for missing birth stone data" do
      get birth_stone_show_path(month: 2)
      expect(response).to redirect_to(root_path)
    end
  end
end
