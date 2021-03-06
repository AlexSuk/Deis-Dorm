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
    @current_u = User.find_by(id: session[:user_id])
  end

  def serveGeojson
    @data = File.read("app/assets/javascripts/brandeismap.json")
    render :json => @data
  end

end
 
