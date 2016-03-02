require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    # test "the truth" do
    #   assert true
    # end

    setup do
    	@user = users(:three)
	end

	test "should get index" do
    	get :index
    	assert_response :success
    	assert_not_nil assigns(:users)
  	end

  	test "should get new" do
    	get :new
    	assert_response :success
  	end

	test "should create user" do
		assert_difference('User.count') do
			post :create, user: { user_name: 'sam', email: 'sam@sam.com', password: 'secret'}
  		end

  		assert_redirected_to root_path
  	end

  	test "should update user" do
		patch :update, id: @user, user: { user_name: @user.user_name, email: 'same@same.com', password: 'secret'}
		assert_redirected_to root_path
	end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to root_path
  end
end

