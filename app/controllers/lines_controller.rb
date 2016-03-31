class LinesController < ApplicationController
  	# skip_before_action :authorize

	def index
		@board = Board.find(params[:board_id])
		@topics = @board.lines.all

	end

	def show
    @board = Board.find(params[:board_id])
    @line = @board.lines.find(params[:id])
		# @users = {}
		# @line.posts.each do |p|
		# 	id = p.user_id
		# 	if !@users.include? id
		# 		u = User.find(id)
		# 		@users[id] = { name: u.user_name, icon: u.icon.url(:thumb) }
		# 	end
		# end
  end

  	def edit
  	end

  	def new
  		@board = Board.find(params[:board_id])
  		@line = @board.lines.new
  	end

  	def create
  		#note to self alex, i added belongs to/has_many relations in the User and line models
  		@board = Board.find(params[:board_id])
  		# @line = @board.lines.new(line_params)
  		@user = User.find_by(id: session[:user_id])
  		@topic = @board.lines.create(line_params.merge(:user_id => @user.id))
      # @topic = @board.lines.create(line_params)

  		# @topic.user_id = @user.id
  		redirect_to board_lines_path
  	end


  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:name, :description, :user_id, :board_id)
    end

end
