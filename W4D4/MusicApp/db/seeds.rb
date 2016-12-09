# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Band.create(name: "Ratatat")
Band.create(name: "Miles Davis")

Album.create(name: "Classics", recording: "studio", band_id: 1)
Album.create(name: "Kind of Blue", recording: "live", band_id: 2)

Track.create(name: "Loud Pipes", kind: "regular", album_id: 1)
Track.create(name: "Milestones", kind: "bonus", album_id: 2)
