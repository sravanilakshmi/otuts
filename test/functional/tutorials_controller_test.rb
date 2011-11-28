require 'test_helper'

class TutorialsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
