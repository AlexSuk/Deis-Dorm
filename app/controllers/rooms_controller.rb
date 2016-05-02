class RoomsController < ApplicationController
before_action :set_search, only: [:update, :room_params]
	def index

		@current_u = User.find_by(id: session[:user_id])
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

		gon.all_dots = Room.where("x_coordinate is NOT NULL")

		chosen_building = params[:building]
		chosen_floor = params[:floor]
		chosen_file = "#{chosen_building}#{chosen_floor}"
		if chosen_file.eql?"Ziv 127Floor 1"
			@chooser = 1
		elsif chosen_file.eql?"Ziv 127Floor 2"
			@chooser = 2
		elsif chosen_file.eql?"Ziv 127Floor 3"
			@chooser = 3
		elsif chosen_file.eql?"Ziv 127Floor 4"
			@chooser = 4
		elsif chosen_file.eql?"Ziv 127Floor 5"
			@chooser = 5
		else 
			@chooser = 6
		end
	end

	def show
    	@room = Room.find(params[:id])

  end

	def update
	  	puts "testing-=================fjdsmfjkdsnfjkdsnfjksdnfkjsndjfndsjknfjksdnfkjnsdjkfnsdjkfndskjfnjksdnfjkdsnfkj"
	    puts "DOES IT NOT REACH HERE"
	    puts "#{@room.number} Hello?"

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

