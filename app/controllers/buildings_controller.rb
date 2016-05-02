class BuildingsController < ApplicationController
  skip_before_action :authorize, only: [:show]

  def show
    @building = Building.find(params[:id])
    user_array = @building.reviews.map { |r| r.user_id}
    @users = User.find(@building.reviews.map { |r| r.user_id })
    @users_map = {}
    @users.each do |user|
      @users_map[user.id] = user
    end
    @reviews_users = {}
    @building.reviews.each do |review|
      @reviews_users[review] = @users_map[review.user_id]
    end

    @picture = Picture.new
  end

end
