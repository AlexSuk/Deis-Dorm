# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'csv'
puts "Loading quads"
Quad.create(name: "Ziv", rating: 4.1, info: "Located on the southern ridge of campus, Ziv Quad is home to many students from our junior and senior classes. Named for Gladys and Sy Ziv, the Quad consists of four buildings: 127, 128, 129 (Mazer Hall), and 130. Ziv residents live in six-person suites. Each air-conditioned suite has six single bedrooms, a spacious common area and two private bathrooms.", years: "0011")
Quad.create(name: "East", rating: 3.7, info: "TFound in a quiet wooded area of upper campus, East Quad is home to the majority of sophomores on campus. East Quad is comprised of four sections with six names: Hassenfeld-Krivof, Shapiro House, Pomerantz-Rubenstein and Swig, yet students refer to the main residence hall buildings as Hassenfeld and Pomerantz. East Quad is conveniently located across the street from Gosman Sports Center and steps away from the Health Center and the Intercultural Center. East was designed to maximize the potential of the residence living environment to become a tight-knit community. With open lounges on most floors, extended corridors, a community kitchen and large common areas, life in East is anything but dull. The top floors of East also provide residents with a clear, breathtaking view of the Boston skyline.", years: "0100")
Quad.create(name: "Massell", rating: 5.0, info: "Massell Quad, encircling the Anne J. Kane Reflecting Pool and the Albert Yakus Meditation Area, consists of four residence halls: Shapiro, Usen, Deroy and Renfield. Massell Quad is comprised of first-year students and is home to the Beit Midrash Jewish study and prayer room. This space, located on the ground floor of Shapiro, is coordinated by students and provides a location for them to study and pray.", years: "1000")
Quad.create(name: "Ridgewood", rating: 3.2, info: "Ridgewood opened in January 2009 as additional apartment style housing for juniors and seniors. Ridgewood accommodates approximately 180 students.", years: "0011")
Quad.create(name: "North", rating: 2.0, info: "North Quad, originally named Leon Court, is comprised of four buildings surrounding a tranquil courtyard: Scheffres, Gordon, Reitman and Cable. Students living in North enjoy traditional-style residence hall living on single sex and mixed gender floors. North Quad sits at the top of campus next to the Rabb Academic Quad, housing most humanities classes, and the Kutz Hall administrative building, housing the University Registrar, Campus Card Office and International Students & Scholars Office, amongst others. Furthermore, North is only steps from the Usdan Student Center, home to Dining Services, Hillel, a convenience store, the campus mailroom, the Chaplaincy, Academic Services, Hiatt Career Center and the Department of Community Living", years: "1000")
Quad.create(name: "Usen Castle", rating: 3.5, info: "Usen Castle and Schwartz Hall offer 120 sophomore students an eclectic style living option on campus with many breathtaking views of the Boston Skyline. The Castle is home to Cholmondeley's, or Chum's, Brandeis's coffeehouse and late night snack bar. The Castle is conveniently located next to the Usdan Student Center which houses Financial Services, Community Living, the campus mailroom, two a la carte dining halls, Hiatt Career Center, Academic Services, Hillel, Chaplains Office and a convenience store. Within close proximity one will also find the Gosman Sports Center, the Rabb Academic Quad, the Science Complex and the Health and Counseling Centers.", years: "0100")
Quad.create(name: "567 South Street", rating: 3.0, info: "567 South Street is an apartment-style living option for sophomores, located next to Cappy's Pizza Parlor and conveniently located across from the Brandeis/Roberts Commuter Rail station. With only 30 residents, 567 South Street provides provides Brandeis students the privacy associated with apartment style living, while being within close distance to the main campus of Brandeis.", years: "0100")
Quad.create(name: "Charles River Apartments", rating: 1.0, info: "Charles River offers an apartment-style living environment located in an off campus setting while still providing residents an on campus community lifestyle. The Charles River Apartments are home to juniors and seniors who enjoy the privacy of the apartment style living as well as its on-campus feel.", years: "0011")
Quad.create(name: "Foster Mods Housing", rating: 4.5, info: "The Foster Student Living Center (Mods) are townhouse style living for approximately 180 seniors. The Foster Mods are located across South Street to provide upper-class students independent living. The Mods are located next to the Gosman Sports Center and have a convenient student parking lot.", years: "0001")
Quad.create(name: "Rosenthal", rating: 4.0, info: "Rosenthal Quad offers 160 sophomores suite-style living in three buildings (Rosenthal South, North, and East). Each suite houses eight students in single and double occupancy rooms.  Each eight-person suite is selected by two groups of four students during Room Selection.  Rosenthal Quad is located in the heart of campus, steps away from the Shapiro Campus Center, Sherman Dining Hall, Massell, the science complex, Goldfarb/Farber Library, the chapels and the Hassenfeld Conference Center. Chapels Field is a great space for outdoor recreational activities and studying.", years: "0100")
Quad.create(name: "Village", rating:4.0, info: "The Village houses 220 students in single and double occupancy rooms. The Village is broken down into three houses (A, B, and C).  For the full academic year, sophomores live in Village A. In the fall, juniors planning to study abroad live in B and C, with Mid-Year students taking their place in the spring semester.", years: "1110")

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

puts "Loading buildings"
#ziv buildings
ziv = Quad.find_by(name: "Ziv")
Building.create(name: "Ziv 127", longitude: -71.2616387, latitude: 42.3633962, description: "Ziv has 4 Community Advisors (CAs) who engage resident in establishing active living and learning environments where each individual is invested in promoting the success and safety of all members of the community.  The CAs create and execute programs, address student concerns, and support the community when issues arise.", is_kind: "dorm", quad_id: ziv.id, years: ziv.years)
Building.create(name: "Ziv 128", longitude: -71.2615093, latitude: 42.3630568, description: "Ziv shares an Area Coordinator (AC), a live-in full time professional staff member with an advanced degree, with Ridgewood.  The AC supervises the CAs, manages the residence halls, and holds regular office hours in the community office.", is_kind: "dorm", quad_id: ziv.id, years: ziv.years)
Building.create(name: "Ziv 129", longitude: -71.2610225, latitude: 42.3629225, description: "Ziv is comprised of six-person suites, each containing six single bedrooms, two bathrooms, and a common space.  Individual bedrooms range in size from approximately 80 to 100 square feet, and each common room provides approximately 500 square feet of shared space.  Students are responsible for cleaning their own bathrooms and common spaces within their suites.", is_kind: "dorm", quad_id: ziv.id, years: ziv.years)
Building.create(name: "Ziv 130", longitude: -71.2608863, latitude: 42.3632783, description: "Ziv is equipped with central air conditioning, laundry facilities in each building, and a central elevator in each of the four buildings.", is_kind: "dorm", quad_id: ziv.id, years: ziv.years)

#east buildings
east = Quad.find_by(name: "East")
Building.create(name: "Hassenfeld", longitude: -71.2548726, latitude: 42.3679261, description: "East has 13 Community Advisors (CAs) who engage residents in establishing active living and learning environments where each individual is invested in promoting the success and safety of all members of the community.  CAs create and execute programs, address student concerns, and support the community when issues arise.East has one Area Coordinator (AC), a live-in full time professional staff member with an advanced degree.  The AC supervises the CAs, manages the residence halls, and holds regular office hours in the community office.", is_kind: "dorm", quad_id: east.id, years: east.years)
Building.create(name: "Pomerantz", longitude: -71.2547494, latitude: 42.3674802, description: "East contains both single sex and mixed gender rooms.  The halls are traditional style, consisting of single and double rooms.  The singles range between 100 and 140 square feet, and the doubles are approximately 200 square feet.Residents of East have access to coin-operated laundry machines, a number of open lounges on each floor, a large central lounge with a television and cardio room, and a community kitchen.", is_kind: "dorm", quad_id: east.id, years: east.years)

#massell buildings
massell = Quad.find_by(name: "Massell")
Building.create(name: "Shapiro", longitude: -71.2614192, latitude: 42.3668253, description: "Massell has 16 Community Advisors (CAs) who engage resident in establishing active living and learning environments where each individual is invested in promoting the success and safety of all members of the community.  The CAs create and execute programs, address student concerns, and support the community when issues arise.", is_kind: "dorm", quad_id: massell.id, years: massell.years)
Building.create(name: "Deroy", longitude: -71.2616125, latitude: 42.3673553, description: "Massell shares an Area Coordinator (AC), a live-in full time professional staff member with an advanced degree, and an Assistant Area Coordinator (AAC), a live-in part time graduate-level staff member earning an advanced degree, with Rosenthal.  The AC and AAC supervise the CAs, manage the residence halls, and hold regular office hours in the community office.", is_kind: "dorm", quad_id: massell.id, years: massell.years)
Building.create(name: "Usen", longitude: -71.2605758, latitude: 42.3671662, description: "Massell has both single gender and mixed gender halls.  Rooms in Massell are all single gender, and can be singles, doubles, or lofted triples.  All rooms open into a main hallway shared by other students.  Single room sizes range from approximately 130 to 160 square feet.  Doubles and lofted triples range from approximately 180 to 200 square feet.", is_kind: "dorm", quad_id: massell.id, years: massell.years)
Building.create(name: "Renfield", longitude: -71.2610296, latitude: 42.3674719, description: "Shapiro Lounge, located at one end of Shapiro Hall, is open 24 hours.  The space has couches, a large screen television, a foosball table, and a ping pong table.  Most floors in Deroy, Renfield, and Usen Halls all have their own lounges, and Massell has community kitchens scattered throughout the buildings.  There are laundry facilities in each building, the largest being in Shapiro Hall.  Also inside Shapiro is the Beit Midrash Jewish Study and Prayer Room.", is_kind: "dorm", quad_id: massell.id, years: massell.years)

#ridgewood buildings
ridgewood = Quad.find_by(name: "Ridgewood")
Building.create(name: "Ridgewood A", longitude: -71.2604928, latitude: 42.3640341, description: "Ridgewood has 3 Community Advisors (CAs) who engage resident in establishing active living and learning environments where each individual is invested in promoting the success and safety of all members of the community.  The CAs create and execute programs, address student concerns, and support the community when issues arise. Ridgewood shares an Area Coordinator (AC), a live-in full time professional staff member with an advanced degree, with Ziv.  The AC supervises the CAs, manages the residence halls, and holds regular office hours in the community office.", is_kind: "dorm", quad_id: ridgewood.id, years: ridgewood.years)
Building.create(name: "Ridgewood B", longitude: -71.2611426, latitude: 42.3638964, description: "Ridgewood is comprised of primarily 4-person apartments, with a few 6-person apartments located in Ridgewood B.  All bedrooms in Ridgewood are single bedrooms, and all apartments are gender neutral.  Each apartment has a private bathroom, kitchen, and common area.  Kitchens are equipped with a stove, oven, dishwasher, full-sized refrigerator, and microwave.  Common areas are equipped with bar stools for the kitchen island, two chairs, and one love seat.  Six-person apartments have two additional chairs.", is_kind: "dorm", quad_id: ridgewood.id, years: ridgewood.years)
Building.create(name: "Ridgewood C", longitude: -71.2607127, latitude: 42.3635757, description: "Located on the bottom floor of Ridgewood A is Ridgewood Commons, a large, open space with a kitchen, a large screen TV, and a hardwired audio-visual system.  Ridgewood Commons has a number of seating options open to anybody using the lounge, as well as additional seating provided to those who reserve the space.  All three Ridgewood buildings are equipped with a central air conditioning system.", is_kind: "dorm", quad_id: ridgewood.id, years: ridgewood.years)

#north buildings
north = Quad.find_by(name: "North")
Building.create(name: "Gordon", longitude: -71.2559024, latitude: 42.3696982, description: "North has 13 Community Advisors (CAs) who engage resident in establishing active living and learning environments where each individual is invested in promoting the success and safety of all members of the community.  The CAs create and execute programs, address student concerns, and support the community when issues arise.", is_kind: "dorm", quad_id: north.id, years: north.years)
Building.create(name: "Scheffres", longitude: -71.2563113, latitude: 42.3692478, description: "North shares an Area Coordinator (AC), a live-in full time professional staff member with an advanced degree, and an Assistant Area Coordinator (AAC), a live-in part time graduate-level staff member earning an advanced degree, with Usen Castle.  The AC and AAC supervise the CAs, manage the residence halls, and hold regular office hours in the community office.", is_kind: "dorm", quad_id: north.id, years: north.years)
Building.create(name: "Reitman", longitude: -71.2553477, latitude: 42.3696856, description: "North has both single gender and mixed gender halls.  Rooms in North are all single gender, and can be singles, doubles, natural triples, or lofted triples.  All rooms open into a main hallway shared by other students.  Single room sizes range from approximately 130 to 160 square feet.  Single rooms vary in size.  On average, doubles and lofted triples are 180 square feet and natural triples are 288 square feet.", is_kind: "dorm", quad_id: north.id, years: north.years)
Building.create(name: "Cable", longitude: -71.2552624, latitude: 42.3692278, description: "Polaris Lounge, located between Scheffres Hall and Gordon Hall, is open 24 hours.  The space has couches, a large screen television, a pool table, a ping pong table, and a kitchen.  There is an additional community kitchen located in the second floor Cable lounge.  Laundry facilities and soda machines are located in each building, and a cardio room is located in the basement of Gordon Hall.", is_kind: "dorm", quad_id: north.id, years: north.years)

#castle
castle = Quad.find_by(name: "Usen Castle")
Building.create(name: "Usen Castle", longitude: -71.2556858, latitude: 42.3672562, description: "Castle Commons, located on the second floor of D Tower, is a unique, round shaped room that includes a fireplace, a community kitchen, couches, a foosball table, a television, and multiple study nooks.  Laundry facilities are located adjacent to Schwartz Hall, behind Usen Castle.  Chum’s, Brandeis’s very own coffee shop and performance venue, is located on the ground floor of Usen Castle Tower B.  The Castle courtyard is equipped with tables and benches, and near the courtyard is a student-run pottery studio.  Behind Usen Castle is a lookout balcony with a wonderful view of Boston’s skyline.", is_kind: "dorm", quad_id: castle.id, years: castle.years)

#567 South Street
south_street = Quad.find_by(name: "567 South Street")
Building.create(name: "567 South Street", longitude: -71.2617369, latitude: 42.3613702, description: "Each apartment in 567 South Street is equipped with a refrigerator, stove, oven, and cabinet space.  On-site coin laundry services are located within the building.  Although 567 South Street is slightly removed from the campus, the school runs a shuttle service (BranVan) to the Brandeis main campus.", is_kind: "dorm", quad_id: south_street.id, years: south_street.years)

#grad buildings
grad = Quad.find_by(name: "Charles River Apartments")
Building.create(name: "Morton May, 110 Angleside Road", longitude: -71.2576588, latitude: 42.3595228, description: "Charles River shares an Area Coordinator (AC), a live-in full time professional staff member with an advanced degree, with the Foster Mods.  The AC supervises the CAs, manages the residence halls, and holds regular office hours in the community office.", is_kind: "dorm", quad_id: grad.id, years: grad.years)
Building.create(name: "Max and Ann Coffman, 150 Charles River Road", longitude: -71.2572095, latitude: 42.3596814, description: "Charles River has 5 Community Advisors (CAs) who engage resident in establishing active living and learning environments where each individual is invested in promoting the success and safety of all members of the community.  The CAs create and execute programs, address student concerns, and support the community when issues arise.", is_kind: "dorm", quad_id: grad.id, years: grad.years)
Building.create(name: "Ollie A. Cohen, 164 Charles River Road", longitude: -71.256805, latitude: 42.3599771, description: "Charles River is comprised of efficiency apartments, as well as two, three, and five bedroom apartments.  All apartments have a kitchen area and bathroom facilities.  Efficiency apartments are single-occupancy one room apartments with a kitchenette and a private bathroom, and are approximately 320 square feet.  Two bedroom apartments have two single rooms with a shared kitchen area and bathroom.  Some two bedroom apartments have a living area, and others do not.  Three bedroom apartments have three single rooms, a shared kitchen area, a bathroom, and a living room.  Five bedroom apartments have five single rooms, a kitchen area, two bathrooms, a storage room, and a living room.  Single rooms within these apartments range from approximately 90 square feet to 160 square feet.  Students are responsible for cleaning their own kitchens, bathrooms, and shared living areas.", is_kind: "dorm", quad_id: grad.id, years: grad.years)
Building.create(name: "George E. Lewis, 178 Charles River Road", longitude: -71.2566022, latitude: 42.3603332, description: "Charles River Commons, located in 150 Charles River Road (Coffman), is a large common area available for student use.  The room has a large, flat-screen TV, a variety of gaming tables, a kitchen area, and cardio equipment.  The Brandeis Shuttle (Bran Van) provides regular service between Charles River and the main campus.  Each of the four buildings has its own laundry room, and parking is available adjacent to the residence halls.", is_kind: "dorm", quad_id: grad.id, years: grad.years)

#mods Buildings
mods = Quad.find_by(name: "Foster Mods Housing")
Building.create(name: "Upper Mods", longitude: -71.2538398, latitude: 42.3662074, description: "The Foster Mods are comprised of four- and six-person town houses designed for independent living.  Each Mod includes a kitchen, dining room, living room, and one or two bathrooms.  All bedrooms are single occupancy, and these bedrooms may fall on the same floor or different floors depending on the layout of the Mod.  Single rooms within these apartments range from 95 square feet to 115 square feet.  Students are responsible for cleaning their own kitchens, bathrooms, and shared living areas.", is_kind: "dorm", quad_id: mods.id, years: mods.years)
Building.create(name: "Lower Mods", longitude: -71.2534663, latitude: 42.3657189, description: "The Foster Mods have 4 Community Advisors (CAs) who engage resident in establishing active living and learning environments where each individual is invested in promoting the success and safety of all members of the community.  The CAs create and execute programs, address student concerns, and support the community when issues arise.", is_kind: "dorm", quad_id: mods.id, years: mods.years)

#rosenthal buildings
rosie = Quad.find_by(name: "Rosenthal")
Building.create(name: "North", longitude: -71.2601768, latitude: 42.3673301, description: "Rosenthal shares an Area Coordinator (AC), a live-in full time professional staff member with an advanced degree, and an Assistant Area Coordinator (AAC), a live-in part time graduate-level staff member earning an advanced degree, with Massell.  The AC and AAC supervise the CAs, manage the residence halls, and hold regular office hours in the community office.", is_kind: "dorm", quad_id: rosie.id, years: rosie.years)
Building.create(name: "East", longitude: -71.259926, latitude: 42.3670715, description: "Rosenthal is comprised of eight-person suites, consisting of single and double occupancy rooms.  Each suite has a large, furnished living room and two private bathrooms.  Single rooms in Rosenthal are approximately 100 square feet, and double rooms are approximately 180 square feet.  Students are responsible for cleaning the bathrooms and common spaces within their suites.", is_kind: "dorm", quad_id: rosie.id, years: rosie.years)
Building.create(name: "South", longitude: -71.2601182, latitude: 42.3668881, description: "Located in Rosenthal South is a community kitchen and lounge space for use by all Rosenthal residents.  Rosenthal East has a dance studio available to all students and Rosenthal North contains the laundry facilities and small cardio room.", is_kind: "dorm", quad_id: rosie.id, years: rosie.years)

#village buildings
Building.create(name: "Village A", longitude: -71.2600058, latitude: 42.3636824, description: "The Village shares an Area Coordinator (AC), a live-in full time professional staff member with an advanced degree, with 567 South Street.  The AC supervises the CAs, manages the residence halls, and holds regular office hours in the community office.", is_kind: "dorm", quad_id: Quad.find_by(name: "Village").id, years: "0100")
Building.create(name: "Village B", longitude: -71.2601989, latitude: 42.3633267, description: "The Village is a traditional style residence hall with single and double occupancy rooms.  All rooms within the Village are gender neutral.  Single rooms in the Village range from approximately 110 to 130 square feet, and double rooms range from approximately 145 to 180 square feet.", is_kind: "dorm", quad_id: Quad.find_by(name: "Village").id, years: "1011")
Building.create(name: "Village C", longitude: -71.2605201, latitude: 42.3630206, description: "The Village has numerous open concept lounge spaces on each floor, and the entire building is equipped with central air conditioning.  Laundry facilities are located on the first floor of Village A House, near the multipurpose dance studio.  A 24-hour cardio gym is available to all residential students with an ID, and is attached to Village B House.  An elevator is located in Village A House, near the community office.", is_kind: "dorm", quad_id: Quad.find_by(name: "Village").id, years:"1011")

random = Random.new()
dorm_buildings = Building.where(is_kind: "dorm")

# =========== BUILDING PHOTOS ======#
puts "Loading building photos"
Building.all.each do |b|
	picture = b.pictures.build(image_file_name: "https://s3.amazonaws.com/deis-dorms-devel/pictures/static/buildings/#{b.id}.jpg")
	picture.save
end

# # ============= ROOMS ============= #
building = 0
puts "Loading rooms"
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

puts "Loading reviews"
# =========== REVIEWS ==============#
$redis.flushall
counter = 0
CSV.foreach("db/reviews.csv") do |row|
	user = User.create( user_name: Faker::Internet.user_name,
			password_digest: BCrypt::Password.create(Faker::Internet.password),
			email: Faker::Internet.email,
			icon_file_name: Faker::Avatar.image
	)
	building = Building.find_by(name: row[1])
	room = Room.find_by(building_id: building.id, number: row[2])
	if room.nil?
		counter += 1
		room = Room.create(number: row[2], building_id: building.id, years_available: building.years, 
			gender: "mixed", kitchen: false, laundry: false, ac: false, area: 160, location: 3, room_type: "double",
			issues: 3)
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
	gen_rating = Review.where(room_id: room.id).average(:rating)
	unless gen_rating.nil?
		room.update(general_rating: gen_rating)
	end
	args = {room: room, cleanliness: row[8].to_f, noisiness: row[9].to_f, light: row[11].to_f, socialness: row[10].to_f}
	RoomCounterJob.synchronous(args)
	RoomIncrJob.synchronous(args)
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
