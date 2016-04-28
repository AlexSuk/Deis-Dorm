class BuildingsController < ApplicationController

  def show
    @building = Building.find(params[:id])
    @users = User.find(@building.reviews.map { |r| r.user_id })
    @reviews_users = Hash[@building.reviews.zip(@users)]
    @picture = Picture.new
  end

end
