# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Review.delete_all
Restaurant.delete_all
puts 'Previous data deleted'

#? --- RESTAURANTS
restaurants = [
  {
    name:         "Le Gourmet",
    address:      "123 Main St, Cityville",
    phone_number: "123-456-7890",
    category:     "french"
  },
  {
    name:         "Sushi World",
    address:      "456 Elm St, Townsville",
    phone_number: "987-654-3210",
    category:     "japanese"
  },
  {
    name:         "Pizza Paradise",
    address:      "789 Oak St, Villageville",
    phone_number: "555-123-4567",
    category:     "italian"
  },
  {
    name:         "Belgian Bites",
    address:      "101 Maple Ave, Boroughburg",
    phone_number: "555-987-6543",
    category:     "belgian"
  },
  {
    name:         "Dragon Wok",
    address:      "202 Pine Ln, Hamletville",
    phone_number: "555-456-7890",
    category:     "chinese"
  }
]

restaurants.each do |attrs|
  Restaurant.create!(attrs)
end

le_gourmet = Restaurant.find_by(name: "Le Gourmet")
sushi_world = Restaurant.find_by(name: "Sushi World")
pizza_paradise = Restaurant.find_by(name: "Pizza Paradise")
belgian_bites = Restaurant.find_by(name: "Belgian Bites")
dragon_wok = Restaurant.find_by(name: "Dragon Wok")

#? --- REVIEWS
Review.create!(
  rating: 5,
  content: 'They paid me!',
  restaurant: le_gourmet
)
Review.create!(
  rating: 3,
  content: 'cold food!',
  restaurant: sushi_world
)
Review.create!(
  rating: 1,
  content: 'waited outside for 3 hours until i realised it was closed on monday!',
  restaurant: pizza_paradise
)
Review.create!(
  rating: 4,
  content: 'Delicious waffles and fries!',
  restaurant: belgian_bites
)
Review.create!(
  rating: 2,
  content: 'The noodles were a bit greasy.',
  restaurant: dragon_wok
)

#? --- LOG
puts "Seeded #{Restaurant.count} restaurants and #{Review.count} reviews."
