require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "Anyone can visit sign up page" do
    get :join

    assert_response :success 
  end 

  test "join shows appropriate labels in the form" do
    get :join

    assert_equal(assigns(:button_label), "Sign Me Up!")   
  end 

  test "The sign up page  has correct title" do
    get :join

    assert_select 'title', "Newbies! Registration"
  end  

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { role: "member", 
                            email: "new@email.com", 
                            name: "new guy", 
                            password: "newpassword", 
                            password_confirmation: "newpassword"}

    assert_redirected_to root_path
    assert_equal "You have been listed as a new user. Your account will take some time to set up. An email will be sent to you when your registration is complete." , flash[:notice]
    end
  end

  test "can find by email" do

    assert_equal( User.find_by_email(users(:two).email).id, 2 )
  end  
end
