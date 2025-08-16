require 'rails_helper'

RSpec.describe "birth_stones/show.html.erb", type: :view do
  let(:birth_stone) do
    BirthStone.new(
      month: "January",
      crystal: "Garnet",
      colour: "Red",
      origin: "India, China, USA",
      properties: "Energy, Health, Wellbeing",
      associated_stones: "Jet, Milky Quartz, Rose Quartz",
      extra_details: "Garnet is known for its deep red color and is associated with passion, energy, and vitality.",
      picture: "garnet.jpg"
    )
  end

  before do
    assign(:birth_stone, birth_stone)
    assign(:month, 1)
  end

  describe "birth stone information display" do
    before do
      render
    end

    it "displays the birth stone title" do
      expect(rendered).to include("Your Birth Stone: Garnet")
    end

    it "displays the crystal name" do
      expect(rendered).to include("Garnet")
    end

    it "displays the month" do
      expect(rendered).to include("Your birth stone for January")
    end

    it "displays all birth stone details" do
      expect(rendered).to include("Color:")
      expect(rendered).to include("Red")
      expect(rendered).to include("Origin:")
      expect(rendered).to include("India, China, USA")
      expect(rendered).to include("Properties:")
      expect(rendered).to include("Energy, Health, Wellbeing")
      expect(rendered).to include("Associated Stones:")
      expect(rendered).to include("Jet, Milky Quartz, Rose Quartz")
    end

    it "displays extra details when present" do
      expect(rendered).to include("Additional Information:")
      expect(rendered).to include("Garnet is known for its deep red color")
    end

    it "applies correct CSS classes" do
      expect(rendered).to include('class="birth-stone-info"')
      expect(rendered).to include('class="stone-details"')
      expect(rendered).to include('class="detail-item mb-3"')
    end
  end

  describe "image display" do
    it "displays placeholder content" do
      render
      expect(rendered).to include('class="placeholder-image mb-3"')
      expect(rendered).to include("💎")
      expect(rendered).to include("Image of Garnet")
    end
  end

  describe "navigation" do
    before do
      render
    end

    it "displays navigation buttons" do
      expect(rendered).to include("Try Another Date")
      expect(rendered).to include("Learn More About Birth Stones")
    end

    it "has correct navigation links" do
      expect(rendered).to include('href="/"')
    end

    it "applies navigation CSS classes" do
      expect(rendered).to include('class="navigation-buttons"')
      expect(rendered).to include('class="btn btn-primary"')
      expect(rendered).to include('class="btn btn-outline-secondary ml-2"')
    end
  end
end
