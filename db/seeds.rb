# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Locality.create(local_one: 'A', local_two: 'B', distance: 5)
Locality.create(local_one: 'B', local_two: 'C', distance: 7)
Locality.create(local_one: 'B', local_two: 'D', distance: 3)
Locality.create(local_one: 'C', local_two: 'E', distance: 4)
Locality.create(local_one: 'D', local_two: 'E', distance: 10)
Locality.create(local_one: 'D', local_two: 'F', distance: 8)
