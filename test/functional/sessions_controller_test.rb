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
end
