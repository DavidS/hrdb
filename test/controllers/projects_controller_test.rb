require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should return a index" do
    get :index
    assert_response :success
  end
  test "should return a view for new" do
    get :new
    assert_response :success
  end
end
