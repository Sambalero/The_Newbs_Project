require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  setup do
    @task = tasks(:one)
  end

  test "all routes redirect public to login page" do

      get :index
      assert_redirected_to login_path

      get :new
      assert_redirected_to login_path

      get :show, id: @task
      assert_redirected_to login_path
      
      get :edit, id: @task
      assert_redirected_to login_path
      
      put :update, id: @task
      assert_redirected_to login_path
      
      delete :destroy, id: @task
      assert_redirected_to login_path
  end
end
