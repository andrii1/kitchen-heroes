# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Listing.destroy_all
User.destroy_all

puts 'everything destroyed'

user1 = User.create!(email: "eichhorn@gmail.com", password: "12345678", first_name: "Pauli", last_name: "Eichhorn", owner: true)
user2 = User.create!(email: "user2@gmail.com", password: "12345678", first_name: "Andrii", last_name: "Gorokhovskyi", owner: true)
user3 = User.create!(email: "user3@gmail.com", password: "12345678", first_name: "Marie", last_name: "Bier", owner: true)

puts 'users created'

listing1 = Listing.new(name: 'Paul-Henri Eichhorn', description: 'I love cooking. I am not a professional cook but I am a good cook. I can cook anything really I just need one day preperation.', price: '420', location: 'Goltsteinstr. 150, Cologne, Germany', availability:"2021-12-20")
listing2 = Listing.new(name: 'Marie-Luise Bier', description: 'I worked as a cook for more than 5 years. I can cook any french dish. My specialty is steak tartare', price: '500', location: 'Rudower Straße 44, Berlin, Germany', availability:"2021-11-17")
listing3 = Listing.new(name: 'Andrii Gorokhovskyi', description: 'I am a professioal cook since 2010. I worked in multiple micheline star restaurants. My specialty is PIGEONNEAUX TRUFFÉS À LA CRÈME', price: '450', location: 'Heerweg 671, Bremen, Germany', availability: "2022-01-17")

puts 'listings created'
file1 = URI.open('https://cdn.pixabay.com/photo/2016/08/23/08/53/tacos-1613795_1280.jpg')
file2 = URI.open('https://cdn.pixabay.com/photo/2021/03/01/15/06/barbecue-6059936_1280.jpg')
file3 = URI.open('https://cdn.pixabay.com/photo/2018/10/22/22/18/steak-3766548_1280.jpg')

listing1.photo.attach(io: file1, filename: 'download.jpg', content_type: 'image/jpg')
listing2.photo.attach(io: file2, filename: 'steak.jpg', content_type: 'image/jpg')
listing3.photo.attach(io: file3, filename: 'pigeon.jpg', content_type: 'image/jpg')

review1 = Review.new(content: 'This chef has done an amazing job on our birthday party! The food was delicious and everyone was very happy')
review2 = Review.new(content: 'OK chef for a good price')
review3 = Review.new(content: 'An outstanding chef. I would recommend for everyone - either for a small or big event. Service was also really good!')

booking1 = Booking.new(date_booking: '2021-11-20')
booking2 = Booking.new(date_booking: '2021-11-23')
booking3 = Booking.new(date_booking: '2021-11-25')

puts 'saving.....'

listing1.user = user1
listing2.user = user2
listing3.user = user3

booking1.listing = listing1
booking2.listing = listing2
booking3.listing = listing3

booking1.user = user1
booking2.user = user2
booking3.user = user3

review1.booking = booking1
review2.booking = booking2
review3.booking = booking3

listing1.save
listing2.save
listing3.save

puts 'saved'
