class BuildingsController < ApplicationController
  skip_before_action :authorize, only: [:show]

  def show
    @building = Building.find(params[:id])
    @quad = Quad.find(@building.quad_id)
    user_array = @building.reviews.map { |r| r.user_id}
    @users = User.find(@building.reviews.map { |r| r.user_id })
    @users_map = {}
    @users.each do |user|
      @users_map[user.id] = user
    end
    @reviews_users = {}
    @building.reviews.each do |review|
      @reviews_users[review] = @users_map[review.user_id]
    end
    @tags = $redis.hgetall("b_#{params[:id]}")

    @picture = Picture.new
  end

  def create_review
		puts "create_review"
    @quad_id = params[:quad_id]
		@building_id = params[:building_id]
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

  def add_tags
		if !params[:selected_tags].nil? && !params[:selected_tags].empty?
			args = {building_id: params[:building_id], tags: params[:selected_tags] }
			review = Review.find(params[:review])
			review.tag_list.add(params[:selected_tags])
			review.save
			TagCounterJob.perform_async(args)
		end
		# if params[:format] == "3" then render 'add_tags' end
		respond_to do |format|
			format.js
			# format.html { render :partial => 'new_review' }
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

  private
    def picture_params
      params.require(:picture).permit(:image)
    end

end
