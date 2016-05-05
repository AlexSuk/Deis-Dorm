class BoardsController < ApplicationController
  	# skip_before_action :authorize

	def index
		@boards = Board.all
	end
	
	def show
	end
end
