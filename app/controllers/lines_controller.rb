class LinesController < ApplicationController

	def index
		@topics = Line.all
	end

	def show
    @topic = Line.find(params[:id])
  	end

  	def new
  	end

end
