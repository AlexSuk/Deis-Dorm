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
		puts "SHOW", params
		@quad = Quad.find(params[:id])
		@buildings = @quad.buildings
		@picture = Picture.new
		@building_tags = {}
		@buildings.each do |build|
			tags = $redis.hgetall("b_#{build.id}")
			top_tags = tags.sort_by { |k,v| -v }.reverse.to_h
			@building_tags[build.id] = top_tags
		end

	end

	def add_tags
		if !params[:selected_tags].nil? && !params[:selected_tags].empty?
			args = {building_id: params[:building_id], tags: params[:selected_tags] }
			review = Review.find(params[:review])
			review.tag_list.add(params[:selected_tags])
			review.save
			TagCounterJob.perform_async(args)
		end
		if params[:format] == "3"
			render 'add_tags'
		end
		# respond_to do |format|
		# 	# format.js { render "alert('Hello Rails');" }
		# 	format.html { render :partial => 'new_post' }
    # end
	end

	def create_post
		puts "create_post"
		@quad = params[:quad_id]
		@building_id = params[:building]
		# room_num = building.rooms.where("number LIKE ?", "%#{params[:room]}%")
		# room = building.rooms.where(number: params[:room])
		# if room.nil?

		content = params[:content]

		tags = content.split.find_all{|word| /^#.+/.match word}
		index = tags.size - 1

		@review = Review.create(text: content,
		 						user_id: session[:user_id],
								building_id: @building_id,
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

		args = {building_id: @building_id, tags: tags }
		TagCounterJob.perform_async(args)

		until index < 0 do
			content.slice! tags[index]
			index -= 1
		end
		@suggested_tags = Tag.find_adj_nouns_verbs( params[:content] )

		respond_to do |format|
      format.js
    end

	end

	def create_photos
		building = Building.find(params[:building_id])
		@picture = building.pictures.build(picture_params)
		if @picture.save
			flash[:notice] = "Successfully added photo"
		end
		redirect_to quad_path(:id => params[:quad_id])
	end


	def do_search
		puts "TESTING THE DO SEARCH"

	end

	private

		def picture_params
			params.require(:picture).permit(:image)
		end

end
