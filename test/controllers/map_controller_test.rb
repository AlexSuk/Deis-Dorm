require 'test_helper'
require 'minitest/autorun'

class MapControllerTest < ActionController::TestCase

  test "should be able to access the page when logged in" do
    get :index
    assert_response :success
  end

  test "should be able to access the page when not logged in" do
  	session.delete :user_id
    get :index
    assert_response :success
  end

  test "should get GeoJson data from json file" do
    get :serveGeojson
    assert_response :success
    assert_not_nil assigns(:data)
  end
end
