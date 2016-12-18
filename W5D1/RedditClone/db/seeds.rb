# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(username: "a", password: "testing")
u2 = User.create!(username: "b", password: "testing")
u3 = User.create!(username: "c", password: "testing")

sub1 = Sub.create!(title: "Coding",
                   description: "Ruby on Rails!",
                   user_id: u1.id)
sub2 = Sub.create!(title: "Music",
                   description: "Notes and stuff",
                   user_id: u1.id)
sub3 = Sub.create!(title: "Art",
                   description: "Notes and stuff",
                   user_id: u1.id)
sub4 = Sub.create!(title: "Space",
                   description: "Notes and stuff",
                   user_id: u1.id)

post1 = Post.create!(title: "Post1", url: "url.com", content: "content", user_id: 1)
post2 = Post.create!(title: "Post2", url: "url.com", content: "content", user_id: 1)
post3 = Post.create!(title: "Post3", url: "url.com", content: "content", user_id: 1)
post4 = Post.create!(title: "Post4", url: "url.com", content: "content", user_id: 1)


postsub1 = PostSub.create!(sub_id: 1, post_id: 1)
postsub2 = PostSub.create!(sub_id: 1, post_id: 2)
postsub3 = PostSub.create!(sub_id: 1, post_id: 3)
postsub4 = PostSub.create!(sub_id: 2, post_id: 1)
