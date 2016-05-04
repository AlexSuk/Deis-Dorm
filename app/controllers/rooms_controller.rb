class RoomsController < ApplicationController
before_action :set_search, only: [:update, :room_params]
	def index

		
		buildings_temp = Building.all
		@buildings = Array.new
		buildings_temp.each do |x|
			@buildings << x.name

		end
		@floors = Array.new
		i = 1;
		while i < 6 do
			temp_floor = "Floor #{i}"
			@floors << temp_floor
			i = i+1
		end

		gon.all_dots_user = Array.new


		filled_coord= Room.where("")
		filled_coord= Room.where("x_coordinate is not NULL")
		filled_coord.each do |each_room|
			room_info = Hash.new
			room_info = {:id => each_room.id, :x_coordinate => each_room.x_coordinate, :y_coordinate => each_room.y_coordinate, :number => each_room.number} 
			gon.all_dots_user << room_info
		end

		@chosen_building_user = params[:building]	
		@chosen_floor_user = params[:floor]
		chosen_file_temp = "assets/#{@chosen_building_user}#{@chosen_floor_user}"
		if @chosen_building_user == "" || @chosen_floor_user == "" 
			@chosen_file_user = ""
		else
			@chosen_file_user = chosen_file_temp.gsub!(/\s+/, '')
		end
		
	end

	def index2
		buildings_temp = Building.all
		@buildings2 = Array.new
		buildings_temp.each do |x|
			@buildings2 << x.name

		end
		@floors2 = Array.new
		i = 1;
		while i < 6 do
			temp_floor = "Floor #{i}"
			@floors2 << temp_floor
			i = i+1
		end


		gon.all_dots = Array.new

		@chosen_building = params[:building]
		@chosen_floor = params[:floor]
		room_building_array = Building.where(:name => @chosen_building)
		room_building = room_building_array[0]

		if @chosen_building != nil
			if @chosen_building!="" && @chosen_floor!=""

				get_floor_array = @chosen_floor.strip.split(/\s+/)
				get_floor = get_floor_array[1].to_i

				filled_coord = Room.where(:building_id => room_building.id)
				filled_coord = filled_coord.where(:floor => get_floor)
				filled_coord= filled_coord.where("x_coordinate is not NULL")
			
			else
				filled_coord= Array.new
			
					
			end

			filled_coord.each do |each_room|
				room_info = Hash.new
				room_info = {:id => each_room.id, :x_coordinate => each_room.x_coordinate, :y_coordinate => each_room.y_coordinate, :number => each_room.number} 
				gon.all_dots << room_info
			end

		end


		


		gon.empty_locations = Array.new
		empty_rooms= Room.where("x_coordinate is NULL")

		empty_rooms.each do |empty_room|
			room_info = Hash.new
			empty_room_building_temp = Building.where(:id =>  empty_room.building_id)
			room_info = {:id => empty_room.id, :x_coordinate => empty_room.x_coordinate, :y_coordinate => empty_room.y_coordinate, :number => empty_room.number, :building_name => empty_room_building_temp.name} 
			gon.empty_locations << room_info
		end

				
		
		chosen_file_temp = "../assets/#{@chosen_building}#{@chosen_floor}"
		if @chosen_building == "" || @chosen_floor == "" 
			@chosen_file = ""
		else
			@chosen_file = chosen_file_temp.gsub!(/\s+/, '')
		end
	end

	def show
    	@room = Room.find(params[:id])

  	end

	def update

	    respond_to do |format|
	      if @room.update_attributes(room_params)
	      
	        format.html { redirect_to @room, notice: 'successfully updated.' }
	        format.js
	        format.json {render json: @room}
	      else
	        format.html { render action: "edit" }
	        format.js
	        format.json {render json: @room}
	      end
		end
	end
	private

		def set_search
     		@room = Room.find(params[:id])
    	end
	    # Using a private method to encapsulate the permissible parameters
	    # is just a good pattern since you'll be able to reuse the same
	    # permit list between create and update. Also, you can specialize
	    # this method with per-user checking of permissible attributes.
	    def room_params
	      params.require(:room).permit(:x_coordinate, :y_coordinate)
	      # params.fetch(:room)
	    end
end

