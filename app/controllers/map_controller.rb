class MapController < ApplicationController
  skip_before_action :authorize

  def index
    gon.buildings = Array.new
    @buildings = Building.all
    @buildings.each do |b|
      bldg = Hash.new
      bldg = {:lat => b["latitude"], :lng => b["longitude"], :name => b["name"], :infowindow => b["description"]}
      gon.buildings << bldg
    end
  end

  def zoom 
    
  end

end
