# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all

rs = [
  {
    name: "Tour d'argent",
    address: "Paris",
    category: "french",
    phone_number: "+33 1 43 54 23 31"
  },
  {
    name: "Paul Bocuse",
    address: "Lyon",
    category: "french",
    phone_number: "+33 0 00 00 00 00"
  },
  {
    name: "Jiro",
    address: "Tokyo",
    category: "japanese",
    phone_number: "+81 3 0000 0000"
  },
  {
    name: "La Pergora",
    address: "Rome",
    category: "italian",
    phone_number: "+39 06 3509 2152"
  },
  {
    name: "Karin",
    address: "Tokyo",
    category: "chinese",
    phone_number: "+81 3 0000 0000"
  }
]

rs.each do |r|
  puts "Creating restaurants"
  Restaurant.create!(r)
end

Review.destroy_all

res = [
  {
    content: "good",
    rating: 5,
    restaurant_id: 12
  }
]

res.each do |r|
  puts "Creating reviews"
  Review.create!(r)
end
