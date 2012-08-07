require 'test_helper'

#  in your Functional Tests
# You should test for things such as:

# was the web request successful?
# was the user redirected to the right page?
# was the user successfully authenticated?
# was the correct object stored in the response template?
# was the appropriate message displayed to the user in the view?

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
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

  test "signup page has correct title" do
    get :new
    assert_response :success
    assert_select 'title', "Newbies! Registration"
  end 


  test "join shows appropriate labels in comments form" do
    get :join
   
    assert_equal(assigns(:button_label), "Sign Me Up!")   
  end


  test "should create user" do

    assert_difference('User.count') do

      post :create, user: { role: "member", 
                            email: "new@email.com", 
                            name: "new guy", 
                            password: "newpassword", 
                            password_confirmation: "newpassword"}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { role: "member", 
                            email: "new@email.com", 
                            name: "new guy", 
                            password: "newpassword", 
                            password_confirmation: "newpassword"}
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
