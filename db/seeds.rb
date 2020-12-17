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

  puts "🍝 Seeding locations..."

  location = Location.create!(
    name: Faker::Movies::HarryPotter.unique.location,
    description: Faker::Movies::HarryPotter.quote
  )

  puts "🍝 Seeding reviews..."
  5.times do
    Review.create!(
      location_id: Location.all.sample.id,
      user_id: User.all.sample.id,
      title: Faker::Music::Prince.song,
      rating: rand(1..5),
      content: Faker::Music::Prince.lyric
    )
  end 
  
  puts "🍝 Seeding trips..."
  5.times do
    Trip.create!(
      location_id: Location.all.sample.id,
      user_id: User.all.sample.id,
      start_date: Faker::Date.between(from: '2018-12-01', to: '2019-01-25'),
      end_date: Faker::Date.between(from: '2019-02-01', to: '2019-03-15'),
      note: Faker::Quote.matz
    )
  end
end


puts "🎉 Done!"