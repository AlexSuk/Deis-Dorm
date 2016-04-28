class PostsController < ApplicationController
	def index
		# @board = Board.find(params[:board_id])
		# @topics = @board.lines.all
		@line = Line.find(params[:line_id])
		@posts = @line.posts.all
	end

	def show
  	end

	def edit
	end

	def new
		# @board = Board.find(params[:board_id])
		# @line = @board.lines.new
		@line = Line.find(params[:line_id])
		@post = @line.posts.new
	end

	def create
    @board = Board.find(params[:board_id])
		@line = @board.lines.find(params[:line_id])
		@post = @line.posts.create({text: post_params[:text], user_id: session[:user_id]})
		@picture = @post.pictures.build(image: post_params[:image])
		if @picture.save
			flash[:notice] = "Successfully created comment."
		end
		redirect_to board_line_path(@board, @line)
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      # @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:text, :image)
    end

end
