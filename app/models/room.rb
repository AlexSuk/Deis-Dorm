class Room < ActiveRecord::Base
	def self.individual_search(params)
		rooms = Array.new
		rooms = Room.valid_rooms(params[:pref_year], params[:room_type], params[:pref_gender])
		room_scores = Array.new
		
		# rooms.each do |room|
		# 	score = (params[:pref_clean] * room.cleanliness) + (params[:pref_noise] * room.noisiness) + (params[:pref_location] * room.location) + (params[:pref_social] * room.social) + (4 * room.light) + (4 * room.issues) + (4 * room.general_rating)
		#   score = score + 
		# 	room_scores.push([room.id,score])
		# end

		#return rooms
		rooma = Room.all.limit(3)
		return rooma
	end

	def self.valid_rooms(year,room_type,gender)
		valid_rooms = Array.new
		if year == "Freshman"
			valid_rooms = Room.year_filtered_array(0)
		elsif year == "Sophomore"
			valid_rooms = Room.year_filtered_array(1)
		elsif year == "Junior"
			valid_rooms = Room.year_filtered_array(2)
		else
			valid_rooms = Room.year_filtered_array(3)
		end	

		valid_rooms.each do |room|
			if room.gender != gender || !room_type.include?("#{room.room_type}")
				valid_rooms.delete(room)
			end
		end

		return valid_rooms
	end

	def self.year_filtered_array(year_int)
	 	filtered_rooms = Array.new
		rooms = Room.all
		rooms.each do |room|
			if room.years_available[year_int] == "1"
				filtered_rooms.push(room)
			end
		end
		return filtered_rooms
	end
end
