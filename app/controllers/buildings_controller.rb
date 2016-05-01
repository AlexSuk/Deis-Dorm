class BuildingsController < ApplicationController
  skip_before_action :authorize, only: [:show]

  def show
    @building = Building.find(params[:id])
    @users = User.find(@building.reviews.map { |r| r.user_id })
    @users_map = {}
    @users.each do |user|
      users[user.id] = user
    end
    # @reviews_users = Hash[@building.reviews.zip(@users)]
    @reviews_users = {}
    @reviews.each do |review|
      
    end

    @picture = Picture.new
  end

end
