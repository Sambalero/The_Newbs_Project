require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = User.new(name: "Bill",
                    email: "Bill@Home",
                    role: "member",
                    approval: true,
                    password: "password",
                    password_confirmation: "password")
    @user.save
    @user2 = User.new(name: "Bob",
                    email: "Bob@Home",
                    role: "member",
                    approval: false,
                    password: "password",
                    password_confirmation: "password")
    @user2.save
  end

	test "login page has correct title" do
    get :new
    assert_response :success
    assert_select 'title', "Newbies! Log In"
  end	
  	
  # test "users can log in" do

  #   post :create, name: @user.name, email: @user.email, password: @user.password

  #   assert_redirected_to root_path
  # end

  # test "log in signs in" do
  #   post :create, name: @user.name, email: @user.email, password: @user.password

  #   assert session[:user_id] #can't test current_user here. why not?
  # end

  # test "users can't log in with wrong password" do
  #   post :create, name: @user.name, email: @user.email, password: "wrong"

  #   assert_equal "Invalid email or password", flash[:alert]
  # end

  # test "users can't log in without approval" do

  #   post :create, name: @user2.name, email: @user2.email, password: @user2.password


  #   assert_equal "Invalid email or password", flash[:alert]
  # end

  # test "users can log out" do
  #   assert true
  # end



  # test "returns meaningful responses" do
  #   assert true
  # end  
end
