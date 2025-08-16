require 'rails_helper'

RSpec.describe BirthStone, type: :model do
  describe "validations" do
    it "is valid with all required attributes" do
      birth_stone = BirthStone.new(
        month: "January",
        crystal: "Garnet",
        colour: "Red",
        origin: "India, China, USA",
        properties: "Energy, Health, Wellbeing",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
      expect(birth_stone).to be_valid
    end

    it "is invalid without a month" do
      birth_stone = BirthStone.new(
        crystal: "Garnet",
        colour: "Red",
        origin: "India, China, USA",
        properties: "Energy, Health, Wellbeing",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
      expect(birth_stone).not_to be_valid
      expect(birth_stone.errors[:month]).to include("can't be blank")
    end

    it "is invalid without a crystal" do
      birth_stone = BirthStone.new(
        month: "January",
        colour: "Red",
        origin: "India, China, USA",
        properties: "Energy, Health, Wellbeing",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
      expect(birth_stone).not_to be_valid
      expect(birth_stone.errors[:crystal]).to include("can't be blank")
    end

    it "is invalid without a colour" do
      birth_stone = BirthStone.new(
        month: "January",
        crystal: "Garnet",
        origin: "India, China, USA",
        properties: "Energy, Health, Wellbeing",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
      expect(birth_stone).not_to be_valid
      expect(birth_stone.errors[:colour]).to include("can't be blank")
    end

    it "is invalid without an origin" do
      birth_stone = BirthStone.new(
        month: "January",
        crystal: "Garnet",
        colour: "Red",
        properties: "Energy, Health, Wellbeing",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
      expect(birth_stone).not_to be_valid
      expect(birth_stone.errors[:origin]).to include("can't be blank")
    end

    it "is invalid without properties" do
      birth_stone = BirthStone.new(
        month: "January",
        crystal: "Garnet",
        colour: "Red",
        origin: "India, China, USA",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
      expect(birth_stone).not_to be_valid
      expect(birth_stone.errors[:properties]).to include("can't be blank")
    end

    it "is invalid without associated stones" do
      birth_stone = BirthStone.new(
        month: "January",
        crystal: "Garnet",
        colour: "Red",
        origin: "India, China, USA",
        properties: "Energy, Health, Wellbeing"
      )
      expect(birth_stone).not_to be_valid
      expect(birth_stone.errors[:associated_stones]).to include("can't be blank")
    end

    it "requires unique month" do
      BirthStone.create!(
        month: "January",
        crystal: "Garnet",
        colour: "Red",
        origin: "India, China, USA",
        properties: "Energy, Health, Wellbeing",
        associated_stones: "Jet, Milky Quartz, Rose Quartz"
      )
      
      duplicate = BirthStone.new(
        month: "January",
        crystal: "Amethyst",
        colour: "Purple",
        origin: "Worldwide",
        properties: "Trust, Intuition",
        associated_stones: "Hematite"
      )
      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:month]).to include("has already been taken")
    end
  end

  describe ".find_by_month" do
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

    it "finds birth stone by month number" do
      birth_stone = BirthStone.find_by_month(1)
      expect(birth_stone).to be_present
      expect(birth_stone.month).to eq("January")
      expect(birth_stone.crystal).to eq("Garnet")
    end

    it "finds birth stone by string month number" do
      birth_stone = BirthStone.find_by_month("1")
      expect(birth_stone).to be_present
      expect(birth_stone.month).to eq("January")
    end

    it "returns nil for invalid month number" do
      birth_stone = BirthStone.find_by_month(13)
      expect(birth_stone).to be_nil
    end

    it "returns nil for non-existent month" do
      birth_stone = BirthStone.find_by_month(2)
      expect(birth_stone).to be_nil
    end

    it "returns nil for nil input" do
      birth_stone = BirthStone.find_by_month(nil)
      expect(birth_stone).to be_nil
    end
  end
end
