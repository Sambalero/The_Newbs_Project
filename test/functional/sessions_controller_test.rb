require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
	test "login page has correct title" do
    get :new
    assert_response :success
    assert_select 'title', "Newbies! Log In"
  end	
  	
  #test "users can log in" do
  #   assert true
  # end

  # test "users can't log in with wrong password" do
  #   assert true
  # end

  # test "users can't log in without approval" do
  #   assert true
  # end

  # test "users can log out" do
  #   assert true
  # end

  # test "users are logged out between sessions" do
  #   assert true
  # end  

  # test "returns meaningful responses" do
  #   assert true
  # end  
end
