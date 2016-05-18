require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  test "should get resultats" do
    get :resultats
    assert_response :success
  end

end
