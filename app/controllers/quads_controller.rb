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
		building_ids = @quad.buildings.map { |b| b.id }
		all_building_reviews = Review.where(building_id: building_ids)
		@pos = all_building_reviews.order("rating DESC").first
		@pos_user = @pos.nil? ? nil : User.find(@pos.user_id)
		@neg = all_building_reviews.order("rating ASC").first
		@neg_user = @neg.nil? ? nil : User.find(@neg.user_id)
		@recent = all_building_reviews.order("updated_at DESC").first
		@recent_user = @recent.nil? ? nil : User.find(@recent.user_id)
		@buildings = @quad.buildings
		@picture = Picture.new
		@building_tags = {}
		@building_ratings = {}
		@buildings.each do |build|
			tags = $redis.hgetall("b_#{build.id}")
			top_tags = tags.sort_by { |k,v| -v }.reverse.to_h
			@building_tags[build.id] = top_tags
			avg = build.reviews.average(:rating)
			unless avg.nil? then @building_ratings[build.id] = (avg * 2).round / 2.0 end
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
		if params[:format] == "3" then render 'add_tags' end
		# respond_to do |format|
		# 	# format.js { render "alert('Hello Rails');" }
		# 	format.html { render :partial => 'new_review' }
    # end
	end

	def create_review
		puts "create_review"
		@quad = params[:quad_id]
		@building_id = params[:building]
		room = Room.where("building_id = ? AND number LIKE ?", @building_id, "%#{params[:room]}%").first
		content = params[:content]

		tags = content.split.find_all{|word| /^#.+/.match word}
		index = tags.size - 1

		@review = Review.create(text: content,
		 						user_id: session[:user_id],
								building_id: @building_id,
								room_id: room.nil? ? nil : room.id,
								rating: params[:rating])
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
		redirect_to quad_building_path(params[:quad_id], params[:building_id])
		# redirect_to "quad/#{params[:quad_id]}/building/#{params[:building_id]}#photos"
	end


	def do_filter
		puts "TESTING THE DO SEARCH"

	end

	private
		def picture_params
			params.require(:picture).permit(:image)
		end

end
