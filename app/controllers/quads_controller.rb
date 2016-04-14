class QuadsController < ApplicationController
	skip_before_action :authorize
  def index
    @all_quads = Quad.all
		@quad_buildings = {}
		@all_quads.each do |quad|
			@quad_buildings[quad] = quad.buildings
		end
  end

	def show
		@quad = Quad.find(params[:id])
		puts @quad, @quad.buildings, "What"
		@buildings = @quad.buildings
		@building = Building.new
		@picture = Picture.new
	end

	def new_post
		puts "WOAH...", params
		@buildings = Quad.find(params[:quad_id]).buildings
		redirect_to quad_path(params[:quad_id])
		# @buildings = Quad.find(params[:id]).buildings
		#
		# respond_to do |format|
		# 	format.js
		# 	format.html { render :partial => 'new_post' }
    # end
	end

	def create_post
		puts params
		@quad = params[:quad_id]
		building = Building.find(params[:building])
		# room_num = building.rooms.where("number LIKE ?", "%#{params[:room]}%")
		# room = building.rooms.where(number: params[:room])
		# if room.nil?
		@review = Review.create(text: params[:content],
		 						user_id: session[:user_id],
								building_id: params[:building],
								room_id: params[:room],
								rating: params[:rating])
		# else
		# 	puts "NO ROOM FOUND!"
		# end
		puts @review

		respond_to do |format|
      format.js
    end

	end

	def new_photos

	end

	def create_photos
		building = Building.find(params[:building_id])
		@picture = building.pictures.build(picture_params)
		if @picture.save
			flash[:notice] = "Successfully created comment."
		end
		redirect_to quad_building_path(:id => building.id, :quad_id => params[:quad_id])
	end

	def do_search
		puts "TESTING THE DO SEARCH"

	end

	private

		def picture_params
			params.require(:picture).permit(:image)
		end

end
