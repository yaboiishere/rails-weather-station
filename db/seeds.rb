# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Person.create([{name: "Киро", weather_station: 1}, {name: "Крис", weather_station: 3},{name: "Злато", weather_station: 4},{name: "Лудия", weather_station: 5}])
Person.create({name: "Мишо", weather_station: 2})