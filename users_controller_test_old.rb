require 'test_helper'

#  in your Functional Tests
# You should test for things such as:

# was the web request successful?
# was the user redirected to the right page?
# was the user successfully authenticated?
# was the correct object stored in the response template?
# was the appropriate message displayed to the user in the view?

#Only admins can create admins (partners)
#sign in as admin
#ALL THE REDIRECTS AND FAILS SHOULD BE IN INTEGRATION TESTS - LOGIN OR ADMIN REQUIRED

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end
##something like this
#from http://asciicasts.com/episodes/157-rspec-matchers-macros
#http://stackoverflow.com/questions/6394414/rspec-rails-login-filter
  #   def login_as_admin  
  #   user = User.new(:username => "Admin", :email => "admin@example.com", :password => "secret")  
  #   user.admin = true  
  #   user.save!  
  #   session[:user_id] = user.id  
  # end 

    @user2 = User.new(name: "Bob",
                    email: "Bob@Home",
                    role: "member",
                    approval: false,
                    password: "password",
                    password_confirmation: "password")
    @user2.save

  test "should get index" do #ADMIN
#FAIL Expected response to be a <:success>, but was <302>
    get :index

    assert_response :success
  end

  test "should get index without flash message" do
    get :index
    assert_equal nil, flash[:notice]
  end

  test "should assign @user with get index" do
#FAIL Expected response to be a <:success>, but was <302>
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
Rails::logger.debug "******************************************"
Rails::logger.debug "booyag"
#Rails::logger.debug "#{User.id}"
Rails::logger.debug "******************************************"   
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
  end

  test "should redirect after creating  user" do
#with correct notice!
      post :create, user: { role: "member", 
                            email: "new@email.com", 
                            name: "new guy2", 
                            password: "newpassword", 
                            password_confirmation: "newpassword"}
 
    assert_redirected_to root_path

  end
  test "should redirect after creating  user with flash message" do
#with correct notice!
      post :create, user: { role: "member", 
                            email: "new@email.com", 
                            name: "new guy2", 
                            password: "newpassword", 
                            password_confirmation: "newpassword"}
 
    refute_equal nil, flash[:notice]
  end

  test "should show user" do
#FAIL Expected response to be a <:success>, but was <302>
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
#PASS - Redirect to login?
    get :edit, id: @user
#    assert_response :success
assert_redirected_to login_path
  end

  test "should update user" do 
  #FAIL Expected response to be a <:success>, but was <302>

    put :update, id: @user, user: { role: "member", 
                            email: "new@email.com", 
                            name: "new guy", 
                            password: "newpassword", 
                            password_confirmation: "newpassword"}

#    assert_redirected_to user_path(assigns(:user))
      assert_response :success
  end

  test "should destroy user" do
#FAIL  "User.count" didn't change by -1. <1> expected but was <2>.

    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end

   # http://guides.rubyonrails.org/testing.html
   # assert_equal 'Post was successfully created.', flash[:notice]
   # refute_equal( expected, actual, [msg] )
   # debug from test
   # Rails::logger.debug "******************************************"
# debug from the controller
#        Rails.logger.debug "-----------------------------"
#     Rails.logger.debug "Posted to users create"
#     Rails.logger.debug "#{User.count}"
#     Rails.logger.debug "-----------------------------"
#     puts "Posted to users create"

