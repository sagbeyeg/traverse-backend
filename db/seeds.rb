# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "🗑 Deleting old users, locations, reviews and trips..." 
User.destroy_all
Location.destroy_all
Review.destroy_all
Trip.destroy_all
Friendship.destroy_all



puts "🍝 Seeding locations..."
Location.create!(
  name: "South Island, New Zealand",
  description: "New Zealand's South Island brims with majestic landscapes at every turn, from dramatic mountains to fjords to glaciers. Here, you can explore Fiordland National Park, a UNESCO World Heritage Area, or gaze at the starry skies at Mount John Observatory."
)
Location.create!(
  name:"Paris",
  description: "Every day, the magnetic City of Light draws visitors from around the globe who come to see iconic attractions like the Eiffel Tower, the Louvre and the Arc de Triomphe. But what travelers really fall in love with are the city's quaint cafes, vibrant markets, trendy shopping districts and unmistakable je ne sais quoi charm."
)

Location.create!(
  name: "Lagos",
  description: "Nigeria is a pulsating powerhouse: as the most populous nation on the continent – nearly every fifth African is Nigerian – it dominates the region. Lagos, the main city, is resurgent: with burgeoning tech industries, posh restaurants and clubs, and an exploding arts scene, this megacity is the face of modern Africa."
)
Location.create!(
  name: "Bora Bora",
  description: "What this small island may lack in size it makes up for in sheer tropical beauty. Here, you'll find picturesque beaches, lush jungles and luxurious resorts. The island's dormant volcano, Mount Otemanu, makes for a great photo-op or challenging hike, and the friendly Bora Bora locals can help you catch a glimpse of the island's best sights during an off-road excursion."
)
Location.create!(
  name: "Glacier National Park",
  description: "Snow-capped peaks and azure lakes are just two reasons why Glacier National Park is one of the most-visited parks in the United States. There are more than 700 miles of hiking trails in this Montana park, plus 13 designated areas for camping. In winter, travelers can enjoy snowshoeing and skiing, while  summer is when vacationers can go swimming and whitewater rafting, among other popular activities. "
)
Location.create!(
  name: "London",
  description: "London is a world unto itself. The eclectic neighborhoods, which house a blend of historical landmarks and modern-day attractions, can keep you occupied for days. If it's your first time in London, save time for a visit to the Tower of London, Tate Modern, Buckingham Palace or the British Museum before sitting down to a classic afternoon tea."
)
Location.create!(
  name: "Maui",
  description: "Whether you're driving along the Road to Hana, enjoying a bird's-eye view of the lush coastline from a helicopter, snorkeling with sea turtles or simply relaxing on the island's honey- or black-colored beaches, you'll find that Maui is unlike any other tropical destination."
)
Location.create!(
  name: "Tahiti",
  description: "Travel to this island – the largest in French Polynesia – if you've been dreaming of a vacation spent lazing in a lavish overwater bungalow. Beyond the posh resorts, Tahiti boasts black sand beaches, a bustling capital and prime snorkeling and surfing conditions."
)
Location.create!(
  name: "Tokyo",
  description: "Simply setting foot in Japan's cosmopolitan capital is an experience within itself. A city known for its bustling streets adorned with flashing neon signs, Tokyo offers visitors a little bit of everything. Foodies won't be let down by the city's fresh sushi and hearty ramen."
)
Location.create!(
  name: "Rome",
  description: "When you visit the Eternal City, prepare to cross a few must-see attractions – including the Colosseum, the Trevi Fountain and the Pantheon – off of your bucket list. Additional treasures, such as St. Peter's Basilica and the Sistine Chapel, can be found in nearby Vatican City."
)
Location.create!(
  name: "Phuket",
  description: "Located in southern Thailand, Phuket offers something for everyone, especially budget-minded travelers. Everything from accommodations to spa treatments to boat tours come with a low price tag. For stunning scenery, check out the limestone cliffs of Phang Nga Bay and lounge on Phuket's gorgeous white sand beaches."
)
Location.create!(
  name: "Barcelona",
  description: "This Spanish city is a feast for the eyes: Visitors can walk past medieval architecture in the Barri Gòtic, snap photos of the intricate Sagrada Família and marvel at Gaudí's whimsical creations in Park Güell."
)
Location.create!(
  name: "New York City",
  description: "New York City hosts infinite urban adventures: You can wander through Central Park, tour the exhibits at the Met, catch a Broadway show or peruse SoHo's stylish boutiques. At night, admire Manhattan's glittering skyscrapers from the top of the Empire State Building or the rooftop bar of your trendy boutique hotel."
) 

puts "🍝 Seeding users..."
10.times do
  user = User.create!(
    name: Faker::JapaneseMedia::OnePiece.unique.character,
    username: Faker::Creature::Cat.unique.name.downcase,
    age: rand(13...100),
    email: Faker::Internet.unique.email,
    password: 'pass123',
    bio: Faker::JapaneseMedia::OnePiece.unique.quote,
    address: Faker::Address.unique.street_address,
    city: Faker::Address.unique.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    zipcode: Faker::Address.unique.zip_code
  )
  puts "🍝 Seeding trips..."
  10.times do
    Trip.create!(
      location_id: Location.all.sample.id,
      user_id: user.id,
      start_date: Faker::Date.between(from: '2020-05-01', to: '2020-12-25'),
      end_date: Faker::Date.between(from: '2020-12-01', to: '2021-01-15'),
      note: Faker::Quote.matz
    )
  end

  puts "🍝 Seeding reviews..."
  10.times do
    Review.create!(
      location_id: Location.all.sample.id,
      user_id: user.id,
      title: Faker::Music::Prince.song,
      rating: rand(3..5),
      content: Faker::Music::Prince.lyric
    )
  end
end

puts "🎉 Done!"