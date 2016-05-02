# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require 'faker'
User.create(user_name: "flash2", password_digest: BCrypt::Password.create('123'), email: "idk@idk.com", admin?: true)
require 'faker'
require 'csv'

Quad.create(name: "Ziv", rating: 4.1, info: "Quad with four buildings. For Juniors and Seniors. Lower campus", years: "0011")
Quad.create(name: "East", rating: 3.7, info: "Two buildings connected with a hallway. For Sophomores. Upper campus", years: "0100")
Quad.create(name: "Massell", rating: 5.0, info: "Freshman dorms in lower campus. Four buildings", years: "1000")
Quad.create(name: "Ridgewood", rating: 3.2, info: "The housing that all juniors want.", years: "0011")
Quad.create(name: "North", rating: 2.0, info: "Cable feels like a prison, but it will get better soon", years: "1000")
Quad.create(name: "Usen Castle", rating: 3.5, info: "Only called castle to attract students, no one actually wants to live in it", years: "0100")
Quad.create(name: "567 South Street", rating: 3.0, info: "Only outcasts want to live here", years: "0100")
Quad.create(name: "Charles River Apartments", rating: 1.0, info: "spiders everywhere", years: "0011")
Quad.create(name: "Foster Mods Housing", rating: 4.5, info: "Expensive but worth", years: "0001")
Quad.create(name: "Rosenthal", rating: 4.0, info: "Worse version of Ziv", years: "0100")
Quad.create(name: "Village", rating:4.0, info: "Housing for midyears, study abroad students, and sophomores", years: "1110")

Board.create(name: "Ziv Quad", description: "Better version of Rosie")
Board.create(name: "Ridgewood", description: "nice housing")
Board.create(name: "East", description: "etc")
Board.create(name: "Masell", description: "etc")
Board.create(name: "North", description: "etc")
Board.create(name: "Usen Castle", description: "etc")
Board.create(name: "567 South Street", description: "etc")
Board.create(name: "Charles River Apartments", description: "etc")
Board.create(name: "Foster Mods Housing", description: "etc")
Board.create(name: "Rosenthal", description: "etc")
Board.create(name: "Village", description: "etc")
Board.create(name: "FAQs/Questions and Answers", description: "etc")


#ziv buildings
ziv = Quad.find_by(name: "Ziv")
Building.create(name: "Ziv 127", longitude: -71.2616387, latitude: 42.3633962, description: "Rightmost Ziv", is_kind: "dorm", quad_id: ziv.id, years: ziv.years)
Building.create(name: "Ziv 128", longitude: -71.2615093, latitude: 42.3630568, description: "Ziv to the left of 127", is_kind: "dorm", quad_id: ziv.id, years: ziv.years)
Building.create(name: "Ziv 129", longitude: -71.2610225, latitude: 42.3629225, description: "Ziv to the right of 130", is_kind: "dorm", quad_id: ziv.id, years: ziv.years)
Building.create(name: "Ziv 130", longitude: -71.2608863, latitude: 42.3632783, description: "Leftmost Ziv", is_kind: "dorm", quad_id: ziv.id, years: ziv.years)

#east buildings
east = Quad.find_by(name: "East")
Building.create(name: "Hassenfeld", longitude: -71.2548726, latitude: 42.3679261, description: "Larger building of East that is further uphill", is_kind: "dorm", quad_id: east.id, years: east.years)
Building.create(name: "Pomerantz", longitude: -71.2547494, latitude: 42.3674802, description: "Smaller building of East that is further downhill", is_kind: "dorm", quad_id: east.id, years: east.years)

#massell buildings
massell = Quad.find_by(name: "Massell")
Building.create(name: "Shapiro", longitude: -71.2614192, latitude: 42.3668253, description: "leftmost in massell quad", is_kind: "dorm", quad_id: massell.id, years: massell.years)
Building.create(name: "Deroy", longitude: -71.2616125, latitude: 42.3673553, description: "to the right of Shapiro", is_kind: "dorm", quad_id: massell.id, years: massell.years)
Building.create(name: "Usen", longitude: -71.2605758, latitude: 42.3671662, description: "rightmost in massell quad", is_kind: "dorm", quad_id: massell.id, years: massell.years)
Building.create(name: "Renfield", longitude: -71.2610296, latitude: 42.3674719, description: "to the left of Usen", is_kind: "dorm", quad_id: massell.id, years: massell.years)

#ridgewood buildings
ridgewood = Quad.find_by(name: "Ridgewood")
Building.create(name: "Ridgewood A", longitude: -71.2604928, latitude: 42.3640341, description: "Ridgewood with the large common area", is_kind: "dorm", quad_id: ridgewood, years: ridgewood.years)
Building.create(name: "Ridgewood B", longitude: -71.2611426, latitude: 42.3638964, description: "Ridgewood next to Spingold", is_kind: "dorm", quad_id: ridgewood, years: ridgewood.years)
Building.create(name: "Ridgewood C", longitude: -71.2607127, latitude: 42.3635757, description: "Ridgewood closest to Dunkin Donuts", is_kind: "dorm", quad_id: ridgewood, years: ridgewood.years)

#north buildings
north = Quad.find_by(name: "North")
Building.create(name: "Gordon", longitude: -71.2559024, latitude: 42.3696982, description: "Connected to the lounge through the first floor.", is_kind: "dorm", quad_id: north.id, years: north.years)
Building.create(name: "Scheffres", longitude: -71.2563113, latitude: 42.3692478, description: "Connected to the lounge through the basement.", is_kind: "dorm", quad_id: north.id, years: north.years)
Building.create(name: "Reitman", longitude: -71.2553477, latitude: 42.3696856, description: "Building with washing machines.", is_kind: "dorm", quad_id: north.id, years: north.years)
Building.create(name: "Cable", longitude: -71.2552624, latitude: 42.3692278, description: "rightmost building in North Quad.", is_kind: "dorm", quad_id: north.id, years: north.years)

#castle
castle = Quad.find_by(name: "Usen Castle")
Building.create(name: "Usen Castle", longitude: -71.2556858, latitude: 42.3672562, description: "Brandeis' infamous castle. It can be quite confusing to navigate...", is_kind: "dorm", quad_id: castle.id, years: castle.years)

#567 South Street
south_street = Quad.find_by(name: "567 South Street")
Building.create(name: "567 South Street", longitude: -71.2617369, latitude: 42.3613702, description: "A single appartment style building next to Cappy's Pizza", is_kind: "dorm", quad_id: south_street.id, years: south_street.years)

#grad buildings
grad = Quad.find_by(name: "Charles River Apartments")
Building.create(name: "Morton May, 110 Angleside Road", longitude: -71.2576588, latitude: 42.3595228, description: "One of four grad dorms", is_kind: "dorm", quad_id: grad.id, years: grad.years)
Building.create(name: "Max and Ann Coffman, 150 Charles River Road", longitude: -71.2572095, latitude: 42.3596814, description: "One of four grad dorms", is_kind: "dorm", quad_id: grad.id, years: grad.years)
Building.create(name: "Ollie A. Cohen, 164 Charles River Road", longitude: -71.256805, latitude: 42.3599771, description: "One of four grad dorms", is_kind: "dorm", quad_id: grad.id, years: grad.years)
Building.create(name: "George E. Lewis, 178 Charles River Road", longitude: -71.2566022, latitude: 42.3603332, description: "One of four grad dorms", is_kind: "dorm", quad_id: grad.id, years: grad.years)

#mods Buildings
mods = Quad.find_by(name: "Foster Mods Housing")
Building.create(name: "Upper Mods", longitude: -71.2538398, latitude: 42.3662074, description: "higher elevation mod area", is_kind: "dorm", quad_id: mods.id, years: mods.years)
Building.create(name: "Lower Mods", longitude: -71.2534663, latitude: 42.3657189, description: "lower elevation mod area", is_kind: "dorm", quad_id: mods.id, years: mods.years)

#rosenthal buildings
rosie = Quad.find_by(name: "Rosenthal")
Building.create(name: "North", longitude: -71.2601768, latitude: 42.3673301, description: "building at the bottom of the hill", is_kind: "dorm", quad_id: rosie.id, years: rosie.years)
Building.create(name: "East", longitude: -71.259926, latitude: 42.3670715, description: "building on the side of the hill", is_kind: "dorm", quad_id: rosie.id, years: rosie.years)
Building.create(name: "South", longitude: -71.2601182, latitude: 42.3668881, description: "building at the top of the hill", is_kind: "dorm", quad_id: rosie.id, years: rosie.years)

#village buildings
Building.create(name: "Village A", longitude: -71.2600058, latitude: 42.3636824, description: "Village next to the music building", is_kind: "dorm", quad_id: Quad.find_by(name: "Village").id, years: "0100")
Building.create(name: "Village B", longitude: -71.2601989, latitude: 42.3633267, description: "The middle portion of village", is_kind: "dorm", quad_id: Quad.find_by(name: "Village").id, years: "1011")
Building.create(name: "Village C", longitude: -71.2605201, latitude: 42.3630206, description: "Village closest to the train station", is_kind: "dorm", quad_id: Quad.find_by(name: "Village").id, years:"1011")

random = Random.new()
dorm_buildings = Building.where(is_kind: "dorm")

# =========== BUILDING PHOTOS ======#
Building.all.each do |b|
	picture = b.pictures.build(image_file_name: "https://s3.amazonaws.com/deis-dorms-devel/pictures/static/buildings/#{b.id}.jpg")
	picture.save
end

# ============= ROOMS ============= #
building = 0

CSV.foreach("db/room_data.csv") do |row|
    has_kitchen = true
    has_laundry = true
    has_ac = true

    if row[0].include? "&"
        building = Building.find_by(name: "#{row[1]}").id
    else
        if row[7].include? "false"
            has_kitchen = false
        end

        if row[8].include? "false"
            has_laundry = false
        end

        if row[9].include? "false"
            has_ac = false
        end
        Room.create(number: "#{row[0]}", building_id: building, floor: "#{row[1]}",
            years_available: "#{row[2]}", room_type: "#{row[3]}", gender: "#{row[4]}",
            price: "#{row[5]}", rough_housing_num: "#{row[6]}", kitchen: has_kitchen,
            laundry: has_laundry, ac: has_ac, area: "#{row[11]}", location: "#{row[12]}",
            cleanliness: 3, noisiness: 3, light: 3, social: 3, issues: 3, general_rating: 3)
    end
end

# =========== REVIEWS ==============#
$redis.flushall
CSV.foreach("db/reviews.csv") do |row|
		user = User.create( user_name: Faker::Internet.user_name,
				password_digest: BCrypt::Password.create(Faker::Internet.password),
				email: Faker::Internet.email,
				icon_file_name: Faker::Avatar.image
		)
		building = Building.find_by(name: row[1])
		room = Room.find_by(building_id: building.id, number: row[2])
		if room.nil?
			room = Room.create(number: row[2], building_id: building.id, years_available: building.years)
		end
    review = Review.create(text: "#{row[5]}\n#{row[7]}",
        rating: (row[4].to_f / 2),
        user_id: user.id,
        building_id: building.id,
				room_id: room.id,
        created_at: row[0],
        updated_at: row[0])
    unless row[6].nil?
      tags = row[6].gsub(/\s+/, "").split("#")
      review.tag_list.add(tags)
			review.save
			args = {building_id: building.id, tags: tags }
			TagCounterJob.perform_async(args)
    end

		args = {room: room, cleanliness: row[8].to_f, noisiness: row[9].to_f, light: row[11].to_f, socialness: row[10].to_f}
		RoomCounterJob.perform_async(args)
end


# (0..100).each do |i|
# 	a_user_name = Faker::Internet.user_name
# 	a_password_digest = Faker::Internet.password
# 	an_email = Faker::Internet.email
#
#  	if random.rand(2) == 1
#  		an_admin = true
#  	else
#  		an_admin = false
#  	end
#
# 	#create a random user using info generated above
# 	#User.create(user_name: a_user_name, password_digest: a_password_digest, email: an_email)
# 	User.create(user_name: a_user_name, password_digest: a_password_digest, email: an_email, admin?: an_admin)
#
# 	the_user = User.find_by(user_name: "#{a_user_name}")
#
# 	#create two reviews for each user
# 	(0..1).each do |j|
# 		Review.create(text: Faker::Hacker.say_something_smart, up_vote: 0, rating: random.rand(5), user_id: the_user.id, building_id: dorm_buildings[random.rand(dorm_buildings.length)].id)
# 	end
# end
