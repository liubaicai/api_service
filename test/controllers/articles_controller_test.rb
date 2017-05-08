require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get cteate" do
    get :cteate
    assert_response :success
  end

end
