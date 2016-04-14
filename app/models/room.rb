class Room < ActiveRecord::Base
	def self.individual_search(params)
		rooms = Room.all
		return rooms
	end
end
