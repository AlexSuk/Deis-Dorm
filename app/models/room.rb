class Room < ActiveRecord::Base
	def self.individual_search(params)
		room = Room.find 1
		#rooms = Room.valid_rooms(params[:pref_year], params[:room_type])
		return rooms
	end

	def self.valid_rooms(year,room_type)
		valid_room_ids = Arry.new
	end
end
