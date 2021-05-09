# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mark = User.create(first_name: "Mark", last_name: "Smith", email: "mark@email.com", password: "123456")
tom = User.create(first_name: "Tom", last_name: "Smith", email: "tom@email.com", password: "123456")
sarah = User.create(first_name: "Sarah", last_name: "Smith", email: "sarah@email.com", password: "123456")

tokyo = Destination.create(city: "Tokyo", country: "Japan")
seattle = Destination.create(city: "Seattle", state: "Washington", country: "United States")
denver = Destination.create(city: "Denver", state: "Colorado", country: "United States")
sf = Destination.create(city: "San Francisco", state: "California", country: "United States")
la = Destination.create(city: "Los Angeles", state: "California", country: "United States")
sydney = Destination.create(city: "Sydney", country: "Australia")
beijing = Destination.create(city: "Beijing", country: "China")
seoul = Destination.create(city: "Seoul", country: "Korea")
houston = Destination.create(city: "Houston", state: "Texas", country: "United States")
portland = Destination.create(city: "Portland", state: "Oregon", country: "United States")
miami = Destination.create(city: "Miami", state: "Florida", country: "United States")
toronto = Destination.create(city: "Toronto", country: "Canada")

itin_1 = Itinerary.create(date: "2021-05-19", user_id: mark.id, destination_id: tokyo.id)
itin_2 = Itinerary.create(date: "2021-05-20", user_id: tom.id, destination_id: tokyo.id)
itin_3 = Itinerary.create(date: "2021-05-21", user_id: sarah.id, destination_id: tokyo.id)
itin_4 = Itinerary.create(date: "2021-04-19", user_id: sarah.id, destination_id: la.id)
itin_5 = Itinerary.create(date: "2021-04-19", user_id: mark.id, destination_id: la.id)
itin_6 = Itinerary.create(date: "2021-04-19", user_id: tom.id, destination_id: miami.id)





