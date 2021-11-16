# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "eichhorn@gmail.com", password: "12345678", first_name: "Pauli", last_name: "Eichhorn", owner: true)
listing = Listing.new(name: 'test listing', description: 'this is the description', price: '10', location: 'Gemrany', availability:"Available")
listing.user = user
listing.save
# user = User.create(email: "paul.eichhorn@gmail.com", password: "12345678", first_name: "Pauli", last_name: "Eichhorn", owner: true)

