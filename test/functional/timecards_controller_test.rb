require 'test_helper'

class TimecardsControllerTest < ActionController::TestCase
  setup do
    @timecard = timecards(:one)
  end

  test "all routes redirect public to login page" do

      get :index
      assert_redirected_to login_path

      get :new
      assert_redirected_to login_path

      get :show, id: @timecard
      assert_redirected_to login_path
      
      get :edit, id: @timecard
      assert_redirected_to login_path
      
      put :update, id: @timecard
      assert_redirected_to login_path
      
      delete :destroy, id: @timecard
      assert_redirected_to login_path
  end
end
