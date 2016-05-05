class HomeController < ApplicationController
	skip_before_action :authorize
  def index
		gon.cloud = Array.new
		gon.counter = 0
		tags = Tag.order("taggings_count DESC").limit(30)
		tags.each do |tag|
			if tag.name == "thinwalls"
				gon.cloud.push({text: tag.name, weight: tag.taggings_count/3})
			else
				gon.cloud.push({text: tag.name, weight: tag.taggings_count})
			end
		end
  end

end
