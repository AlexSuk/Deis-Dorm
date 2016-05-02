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
		@buildings = @quad.buildings
		@building = Building.new
		@picture = Picture.new
		@review_text = ""
		@tags = Tag.find_adj_nouns_verbs(@review_text)
	end

	def new_post
		puts "new_post"
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
		puts "create_post"
		@quad = params[:quad_id]
		# building = Building.find(params[:building])
		# room_num = building.rooms.where("number LIKE ?", "%#{params[:room]}%")
		# room = building.rooms.where(number: params[:room])
		# if room.nil?

		content = params[:content]

		tags = content.split.find_all{|word| /^#.+/.match word}
		index = tags.size - 1

		@review = Review.create(text: content,
		 						user_id: session[:user_id],
								building_id: params[:building],
								room_id: params[:room],
								rating: params[:rating])
		# else
		# 	puts "NO ROOM FOUND!"
		# end
		tags = tags.map { |t|
			t[1..-1]
	  }
		@review.tag_list.add(tags)
		@review.save

		args = {building_id: params[:building], tags: tags }
		puts "Args-=-=-=-=-=-=-=-=-=-=-", args
		CounterJob.perform_async(args)

		puts "User", session[:user_id]
		puts "REVIEW", @review
		puts "Tags", tags

		until index < 0 do
			# content = content.strip.chomp(tags[index])
			content.slice! tags[index]
			index -= 1
		end

		@suggested_tags = Tag.find_adj_nouns_verbs( params[:content] )
		puts "suggested_tags", @suggested_tags

		args = {building_id: params[:building], tags: @suggested_tags }
		puts "Suggested Args-=-=-=-=-=-=-=-=-=-=-", args
		CounterJob.perform_async(args)

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
