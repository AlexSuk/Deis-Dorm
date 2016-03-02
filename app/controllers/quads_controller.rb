class QuadsController < ApplicationController
	skip_before_action :authorize
  def index
    @all_quads = Quad.all
  end

end
