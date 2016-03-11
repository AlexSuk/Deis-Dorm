require 'test_helper'
require 'minitest/autorun'

class ForumControllerTest < ActionController::TestCase

  test "should redirect when not logged in" do
  	session.delete :user_id
    get :index
    assert_response :redirect
    assert_redirected_to login_url

  end

  test "should be able to log in when signed in" do
    get :index
    assert_response :success

  end


end