# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

Quad.create(name: "Ziv", rating: 4.1, info: "Quad with four buildings. For Juniors and Seniors. Lower campus")
Quad.create(name: "East", rating: 3.7, info: "Two buildings connected with a hallway. For Sophomores. Upper campus")
Quad.create(name: "Massell", rating: 5.0, info: "Freshman dorms in lower campus. Four buildings")
Quad.create(name: "Ridgewood", rating: 3.2, info: "The housing that all juniors want.")
Quad.create(name: "North", rating: 2.0, info: "Cable feels like a prison, but it will get better soon")
Quad.create(name: "Castle", rating: 3.5, info: "Only called castle to attract students, no one actually wants to live in it")
Quad.create(name: "567 South Street", rating: 3.0, info: "Only outcasts want to live here")
Quad.create(name: "Charles River Apartment", rating: 1.0, info: "spiders everywhere")
Quad.create(name: "Foster Mods Housing", rating: 4.5, info: "Expensive but worth")
Quad.create(name: "Rosenthal", rating: 4.0, info: "Worse version of Ziv")
Quad.create(name: "Village", rating:4.0, info: "Housing for midyears, study abroad students, and sophomores")

Building.create(name: "ziv 127", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "ziv 128", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "ziv 129", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "ziv 130", longitude:, latitude:, description:, type:, quad_id:)

Building.create(name: "Hassenfeld", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "Pomerantz", longitude:, latitude:, description:, type:, quad_id:)

Building.create(name: "Shapiro", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "Deroy", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "Usen", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "Renfield", longitude:, latitude:, description:, type:, quad_id:)Ridgewood B

Building.create(name: "Ridgewood A", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "Ridgewood B", longitude:, latitude:, description:, type:, quad_id:)
Building.create(name: "Ridgewood C", longitude:, latitude:, description:, type:, quad_id:)


random = Random.new()
(0..100).each do |i|
	a_user_name = Faker::Internet.user_name
	a_password_digest = Faker::Internet.password
	an_email = Faker::Internet.email

	if random.rand(1) == 1
		an_admin = true
	else 
		an_admin = false
	end

	User.create(user_name: a_user_name, password_digest: a_password_digest, email: an_email, admin: an_admin)
	the_user = User.find_by user_name '#{a_user_name}'
	
	(0..1).each do |j|
		Review.create(text: Faker::Hacker.say_something_smart, upvote: 0, rating: random(5), user_id: the_user.id, building_id:)
	end
end

	