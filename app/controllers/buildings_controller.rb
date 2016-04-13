class BuildingsController < ApplicationController

  def show
    @building = Building.find(params[:id])
  end

end
