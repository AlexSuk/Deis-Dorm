class MapController < ApplicationController
  skip_before_action :authorize

  def index
    gon.buildings = Array.new
    @buildings = Building.all
    @buildings.each do |b|
      bldg = Hash.new
      bldg_id = Building.find_by(name: "#{b["name"]}").id
      bldg = {:lat => b["latitude"], :lng => b["longitude"], :name => b["name"], :infowindow => b["description"], :quad_id => b["quad_id"], :id => bldg_id}
      gon.buildings << bldg
    end
  end

  def zoom

  end

end
