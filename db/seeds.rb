# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = Edge.create(name: 'A')
b = Edge.create(name: 'B')
c = Edge.create(name: 'C')
d = Edge.create(name: 'D')
e = Edge.create(name: 'E')
f = Edge.create(name: 'F')

Distance.create(src: a, dst: b, length: 5)
Distance.create(src: b, dst: c, length: 7)
Distance.create(src: b, dst: d, length: 3)
Distance.create(src: c, dst: e, length: 4)
Distance.create(src: d, dst: e, length: 10)
Distance.create(src: d, dst: f, length: 8)
