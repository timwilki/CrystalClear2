require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  describe "form rendering" do
    before do
      render
    end

    it "displays the main heading" do
      expect(rendered).to include("Discover Your Birth Stone")
    end

    it "displays the description text" do
      expect(rendered).to include("Enter your birth month and day to find your special gemstone")
    end

    it "renders the form with correct action" do
      expect(rendered).to include('action="/birth-stone"')
      expect(rendered).to include('method="post"')
    end

    it "renders month select field" do
      expect(rendered).to include('name="month"')
      expect(rendered).to include("January")
      expect(rendered).to include("December")
    end

    it "renders day select field" do
      expect(rendered).to include('name="day"')
      expect(rendered).to include("1")
      expect(rendered).to include("31")
    end

    it "renders go button" do
      expect(rendered).to include("Find My Birth Stone")
      expect(rendered).to include('type="submit"')
      expect(rendered).to include('go-button-')
      expect(rendered).to include('class="go-button"')
    end

    it "applies correct CSS classes" do
      expect(rendered).to include('class="card p-4"')
      expect(rendered).to include('class="form-group"')
      expect(rendered).to include('class="form-control"')
      expect(rendered).to include('class="go-button"')
    end
  end

  describe "error display" do
    it "displays flash alert when present" do
      flash[:alert] = "Please select a valid month and day"
      render
      expect(rendered).to include("Please select a valid month and day")
      expect(rendered).to include('class="alert alert-danger mb-4"')
    end

    it "does not display alert when no flash message" do
      render
      expect(rendered).not_to include('class="alert alert-danger"')
    end
  end
end
