class QuadsController < ApplicationController
  def index
    @all_quads = Quad.all
  end

end
