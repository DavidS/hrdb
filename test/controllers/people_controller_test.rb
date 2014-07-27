require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  test "should return a view for new" do
    get :new
    assert_response :success
  end
end
