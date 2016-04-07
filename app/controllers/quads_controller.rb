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
		@buildings = Quad.find(params[:id]).buildings
	end

	def do_search
		puts "TESTING THE DO SEARCH"

	end

end
