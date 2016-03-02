require 'test_helper'

class QuadsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should be able to access page when logged in" do
  	session.delete :user_id
    get :index
    assert_response :success

  end
end
