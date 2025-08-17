# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Birth Stone Data - Based on traditional birth stone associations
birth_stones_data = [
  {
    month: "January",
    crystal: "Garnet",
    colour: "Red",
    origin: "India, China, USA",
    properties: "Energy, Health, Wellbeing",
    associated_stones: "Jet, Milky Quartz, Rose Quartz",
    extra_details: "Garnet is known for its deep red color and is associated with passion, energy, and vitality.",
    picture: "garnet.png"
  },
  {
    month: "February",
    crystal: "Amethyst",
    colour: "Purple",
    origin: "Worldwide",
    properties: "Trust, Intuition, Spirituality, Insomnia",
    associated_stones: "Hematite",
    extra_details: "Amethyst is prized for its beautiful purple hue and calming properties.",
    picture: "Amethyst.png"
  },
  {
    month: "March",
    crystal: "Aquamarine",
    colour: "Duck egg blue",
    origin: "Brazil, Russia, Kenya, Madagascar, Midwestern USA",
    properties: "Stress Relief, Soothing, Deepening Meditative States",
    associated_stones: "Jade, Jasper",
    extra_details: "Aquamarine's name comes from the Latin words for water and sea, reflecting its ocean-like color.",
    picture: "Aquamarine.png"
  },
  {
    month: "April",
    crystal: "Diamond",
    colour: "Clear",
    origin: "Russia, Botswana, DRC, Australia, Canada",
    properties: "Amplification, Strength, Positivity",
    associated_stones: "Clear Quartz, Hematite, Rutilated Quartz",
    extra_details: "Diamond is the hardest natural substance on Earth and symbolizes eternal love.",
    picture: "diamond.png"
  },
  {
    month: "May",
    crystal: "Amber",
    colour: "Dark gold",
    origin: "Poland, Russia, UK",
    properties: "Concentration, Purification, Health",
    associated_stones: "Beryl, Rhodonite",
    extra_details: "Amber is fossilized tree resin and often contains ancient insects or plant matter.",
    picture: "Amber.png"
  },
  {
    month: "June",
    crystal: "Moonstone",
    colour: "White",
    origin: "Brazil, India, Germany, Sri Lanka, Madagascar, Myanmar, Mexico, Tanzania, USA",
    properties: "Stability, Divinity, Sensuality",
    associated_stones: "Agate, Blue Lace Agate, Smoky Quartz",
    extra_details: "Moonstone exhibits a beautiful adularescence that resembles moonlight.",
    picture: "moonstone.png"
  },
  {
    month: "July",
    crystal: "Ruby",
    colour: "Red",
    origin: "Thailand, Cambodia, Myanmar, India, Afghanistan, Australia, Namibia, Columbia, Japan, Scotland, Brazil, Pakistan",
    properties: "Passion, Protection, Prosperity",
    associated_stones: "Chrysoprase, Onyx, Pyrite, Yellow Fluorite",
    extra_details: "Ruby is one of the most valuable gemstones and represents love and passion.",
    picture: "ruby.png"
  },
  {
    month: "August",
    crystal: "Tiger's Eye",
    colour: "Gold and Brown",
    origin: "South Africa, Thailand, Canada, Western Australia, Spain, Brazil, China, Myanmar, India, USA",
    properties: "Good fortune, Prosperity, Inspiration, Bravery",
    associated_stones: "Carnelian, Labradorite, Peridot, Sunstone",
    extra_details: "Tiger's Eye exhibits a chatoyant effect that resembles a cat's eye.",
    picture: "tigereye.png"
  },
  {
    month: "September",
    crystal: "Aventurine",
    colour: "Green",
    origin: "India",
    properties: "Good Fortune, Opportunity, Confidence",
    associated_stones: "Lapis Lazuli, Selenite",
    extra_details: "Aventurine is a form of quartz with inclusions that give it a shimmering effect.",
    picture: "Aventurine.png"
  },
  {
    month: "October",
    crystal: "Opal",
    colour: "Various",
    origin: "Australia, Mexico, Brazil, Indonesia, Czech Republic, Ethiopia, USA",
    properties: "Optimism, Reflection, Calm",
    associated_stones: "Tourmaline",
    extra_details: "Opal displays a unique play of color that changes with viewing angle.",
    picture: "white-opal.png"
  },
  {
    month: "November",
    crystal: "Obsidian",
    colour: "Black",
    origin: "USA, Canada, Mexico, Guatemala, Argentina, Chile, Greece, Hungary, Italy, Iceland, Russia, New Zealand, Japan, Kenya",
    properties: "Self Reflection, Growth, Protection",
    associated_stones: "Citrine",
    extra_details: "Obsidian is volcanic glass and has been used for tools and weapons for thousands of years.",
    picture: "obsidian.png"
  },
  {
    month: "December",
    crystal: "Turquoise",
    colour: "Bluey Green",
    origin: "Iran, Afghanistan, China, Australia, Chile, Mexico, USA",
    properties: "Health, Wisdom, Protection",
    associated_stones: "Zircon",
    extra_details: "Turquoise has been prized by cultures worldwide for its distinctive blue-green color.",
    picture: "turquoise.png"
  }
]

# Create birth stone records
birth_stones_data.each do |stone_data|
  BirthStone.find_or_create_by!(month: stone_data[:month]) do |stone|
    stone.crystal = stone_data[:crystal]
    stone.colour = stone_data[:colour]
    stone.origin = stone_data[:origin]
    stone.properties = stone_data[:properties]
    stone.associated_stones = stone_data[:associated_stones]
    stone.extra_details = stone_data[:extra_details]
    stone.picture = stone_data[:picture]
  end
end

puts "Birth stone data seeded successfully!"
