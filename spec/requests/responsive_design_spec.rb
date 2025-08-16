require 'rails_helper'

RSpec.describe "Responsive Design", type: :request do
  describe "homepage responsive elements" do
    it "includes responsive CSS classes" do
      get root_path
      expect(response.body).to include('class="container"')
      expect(response.body).to include('class="card p-4"')
      expect(response.body).to include('class="form-control"')
      expect(response.body).to include('class="btn btn-primary"')
    end

    it "includes proper viewport meta tag" do
      get root_path
      expect(response.body).to include('width=device-width,initial-scale=1')
    end

    it "includes responsive form elements" do
      get root_path
      expect(response.body).to include('name="month"')
      expect(response.body).to include('name="day"')
      expect(response.body).to include('type="submit"')
    end
  end

  describe "results page responsive elements" do
    before do
      BirthStone.create!(
        month: "January",
        crystal: "Garnet",
        colour: "Red",
        origin: "India, China, USA",
        properties: "Energy, Health, Wellbeing",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
    end

    it "includes responsive layout classes" do
      get birth_stone_show_path(month: 1)
      expect(response.body).to include('class="birth-stone-info"')
      expect(response.body).to include('class="stone-details"')
      expect(response.body).to include('class="navigation-buttons"')
    end

    it "includes responsive navigation" do
      get birth_stone_show_path(month: 1)
      expect(response.body).to include('class="btn btn-primary"')
      expect(response.body).to include('class="btn btn-outline-secondary ml-2"')
    end
  end
end
