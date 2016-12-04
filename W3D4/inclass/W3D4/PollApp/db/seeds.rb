# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bob = User.create!(user_name: "Bob")
joe = User.create!(user_name: "Joe")
georgina = User.create!(user_name: "Georgina")

poll1 = Poll.create!(user_id: 1, title: "Fav stuff")
poll2 = Poll.create!(user_id: 2, title: "Best coding")

q1 = Question.create!(poll_id: 1, text: "Whats yer fav color")
ac1 = AnswerChoice.create!(question_id: 1, text: "blue")
ac2 = AnswerChoice.create!(question_id: 1, text: "chartreuse")
r1 = Response.create!(answer_id: 2, user_id: 3)
