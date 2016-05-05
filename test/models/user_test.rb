require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "ensure at least one user remained" do
    assert_not_equal User.count,0
  end

end
