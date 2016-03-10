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

  test "should not destroy last user" do
    delete :destroy, id: users(:one)
    delete :destroy, id: users(:two)
    delete :destroy, id: users(:three)
    delete :destroy, id: users(:admin)

    assert_equal(User.count, 1)

  end

  # Need to modify later when we create admin column
  test "should not destroy last admin" do
    assert_difference('User.count', 0) do
    		delete :destroy, id: users(:admin)
  	end
  end

  test "should restrict duplicates" do
    assert_difference('User.count', 0) do
		post :create, user: { user_name: 'admin', email: 'sam@sam.com', password: 'secret'}
	end
  end

  #extra minitest tests
	describe User do
  		it "has four users in database" do
  			User.count.must_equal 4
		end

		it "won't accept user without a password" do
  			User.create(user_name: "jonathan", email: "jmaeda@brandeis.edu")
  			User.count.must_equal 4
		end

		it "should provide an array after calling index" do
			get :index
  			assert_response :success
  			assert_not_nil assigns(:users)
  			users.must_be_kind_of Array
		end
	end
end


