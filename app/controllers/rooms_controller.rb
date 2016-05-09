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
			room_info = {:id => each_room.id, :x_coordinate => each_room.x_coordinate, :y_coordinate => each_room.y_coordinate, :number => each_room.number, :floor => each_room.floor}
			gon.all_dots_user << room_info
		end

		@chosen_building_user = params[:building]
		@chosen_floor_user = params[:floor]
		# chosen_file_temp = "assets/#{@chosen_building_user}#{@chosen_floor_user}"
		puts @chosen_building_user
		puts @chosen_floor_user
		chosen_file_temp = "https://s3.amazonaws.com/deis-dorms-devel/pictures/static/floor_plans/#{@chosen_building_user}#{@chosen_floor_user}.png"
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
				room_info = {:id => each_room.id, :x_coordinate => each_room.x_coordinate, :y_coordinate => each_room.y_coordinate, :number => each_room.number,:floor => each_room.floor}
				gon.all_dots << room_info
			end

		end





		gon.empty_locations = Array.new
		empty_rooms= Room.where("x_coordinate is NULL")

		empty_rooms.each do |empty_room|
			room_info = Hash.new
			empty_room_building_array = Building.where(:id =>  empty_room.building_id)
			empty_room_building_temp = empty_room_building_array[0]
			room_info = {:id => empty_room.id, :x_coordinate => empty_room.x_coordinate, :y_coordinate => empty_room.y_coordinate, :number => empty_room.number, :building_name => empty_room_building_temp.name, :floor => empty_room.floor}
			gon.empty_locations << room_info
		end



		# chosen_file_temp = "../assets/#{@chosen_building}#{@chosen_floor}"
		chosen_file_temp = "https://s3.amazonaws.com/deis-dorms-devel/pictures/static/floor_plans/#{@chosen_building}#{@chosen_floor}.png"
		if @chosen_building == "" || @chosen_floor == ""
			@chosen_file = ""
		else
			puts "SUCCESS"
			@chosen_file = chosen_file_temp.gsub!(/\s+/, '')
		end
	end

	def show
    	@room = Room.find(params[:id])
    	@building = Building.find(@room.building_id)
    	@quad = Quad.find(@building.quad_id)
    	@reviews = Array.new
    	@reviews = Review.all.where(room_id: @room.id)
    	@users = User.find(@reviews.map { |r| r.user_id })
	    @users_map = {}
	    @users.each do |user|
	      @users_map[user.id] = user
	    end
	    @reviews_users = {}
	    @reviews.each do |review|
	      @reviews_users[review] = @users_map[review.user_id]
	    end
	    @description = build_properties_string(@room)
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
		def build_properties_string(room)
			response = ""
			response += "This room is for"
			years = Array.new
			if room.years_available[0] == "1"
				years.push " Freshmen"
			end
			if room.years_available[1] == "1"
				years.push " Sophomores"
			end
			if room.years_available[2] == "1"
				years.push " Juniors"
			end
			if room.years_available[3] == "1"
				years.push " Seniors"
			end

			years.each do |year|
				response += year
				if years.index(year) == years.size - 1
					response += ". "
				elsif years.size > 1
					if years.index(year) == years.size - 2
						response +=" and "
					else
						resposne +=","
					end
				else
				end
			end

			response += "The room has an area of #{room.area} square feet. It is usually picked by housing number #{room.rough_housing_num}. This room can be used by the following gender(s): #{room.gender}."

			return response
		end

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
