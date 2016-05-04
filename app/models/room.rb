class Room < ActiveRecord::Base
	def self.individual_search(params)
		rooms = Array.new
		rooms = Room.valid_rooms(params[:pref_year], params[:room_type], params[:pref_gender], params[:housing_number])
		room_scores = Array.new
		room_areas = Array.new
		room_prices = Array.new
		
		rooms.each do |room|
			if room.room_type == "single" || room.room_type == "suite"
				room_areas.push([room.id,room.area])
			elsif room.room_type == "double"
				room_areas.push([room.id,room.area/2])
			else
				room_areas.push([room.id,room.area/3])
			end
		end
		sorted_room_areas = room_areas.sort_by{|e| e[1]}

		rooms.each do |room|
			room_prices.push([room.id, room.price])
		end
		sorted_room_prices = room_prices.sort_by{|e| e[1]}

		rooms.each do |room|
			puts params[:pref_clean] + " --1"
			puts params[:pref_noise] + " --2"
			puts params[:pref_location] + " --3"
			puts params[:pref_social] + " --4"

			score = (params[:pref_clean].to_i * room.cleanliness) + (params[:pref_noise].to_i * room.noisiness) + (params[:pref_location].to_i * room.location) + (params[:pref_social].to_i * room.social) + (4 * room.light) + (5 * room.issues) + (6 * room.general_rating)
			
			if room.kitchen == true && room.laundry == true
				score += 24
			elsif room.kitchen == true || room.laundry == true
				score += 18
			else
				score += 12
			end

			if room.ac == true
				score += params[:pref_ac].to_i * 4
			else
				score += params[:pref_ac].to_i * 2
			end

			row = sorted_room_areas.detect{|aa| aa.include?(room.id)}
			score += ((sorted_room_areas.index(row) + 0.0) / sorted_room_areas.size) * 4 * params[:pref_size].to_i

			row = sorted_room_prices.detect{|aa| aa.include?(room.id)}
			score += ((sorted_room_prices.index(row) + 0.0) / sorted_room_prices.size) * 4 * params[:pref_price].to_i

			room_scores.push([room.id,score])
		end
		sorted_room_scores = room_scores.sort_by{|e| e[1]}.reverse

		results = Array.new
		if sorted_room_scores.size == 0
		elsif sorted_room_scores.size < 5
			sorted_room_scores.each do |room|
				results.push(Room.find(room[0]))
			end
		else
			results = Room.where(id: [sorted_room_scores[0][0],sorted_room_scores[1][0], sorted_room_scores[2][0], sorted_room_scores[3][0], sorted_room_scores[4][0]])
		end
		return results		
	end

	def self.valid_rooms(year,room_type,gender,housing_num)
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

		valid_rooms.reverse.each do |room|
			if room.gender != gender || !room_type.include?("#{room.room_type}")
				valid_rooms.delete(room)
			elsif housing_num.to_i > 0
				if room.rough_housing_num < (housing_num.to_i - 100)
					valid_rooms.delete(room)
				end
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
