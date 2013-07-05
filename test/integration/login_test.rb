require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  fixtures :users


  test "login" do
    get "/login" 

    assert_response :success

    post_via_redirect "/login", name: users(:one).name, password: users(:one).password



    #    assert_equal '/admin', path nope-/login!
    # The above was based on http://guides.rubyonrails.org/testing.html

  end  
test "title" do
visit "/login"
#assert_select 'title', "Log In" ->  undefined method `content_type' for nil:NilClass (wtf?)
    assert page.has_content?("Log In")
end

test "get index" do
visit "/login"
    post_via_redirect "/login", name: users(:one).name, password: users(:one).password

    assert_response :success
#this passes, which should mean that Bob is logged in, but then, the log says 

# Started GET "/login" for 127.0.0.1 at 2013-07-05 14:30:17 -0700
# Processing by SessionsController#new as HTML
#   Rendered sessions/new.html.erb within layouts/application (4.3ms)
#   Rendered layouts/_head.html.erb (1.7ms)
#   Rendered layouts/_fluidnav.html.erb (0.9ms)
# Completed 200 OK in 21ms (Views: 20.3ms | ActiveRecord: 0.0ms)
#   [1m[35mUser Load (1.9ms)[0m  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT 1  [["id", 980190962]]
# Started POST "/login" for 127.0.0.1 at 2013-07-05 14:30:17 -0700
# Processing by SessionsController#new as HTML
#   Parameters: {"name"=>"Bill", "password"=>"[FILTERED]"}
#   Rendered sessions/new.html.erb within layouts/application (1.0ms)
#   Rendered layouts/_head.html.erb (1.1ms)
#   Rendered layouts/_fluidnav.html.erb (0.2ms)
# Completed 200 OK in 3ms (Views: 3.2ms | ActiveRecord: 0.0ms)
# Started GET "/users/index" for 127.0.0.1 at 2013-07-05 14:30:17 -0700
# Processing by UsersController#show as HTML
#   Parameters: {"id"=>"index"}
# Redirected to http://www.example.com/login
# Filter chain halted as :login_required rendered or redirected

get "users/index"

assert_response :success
#FAIL Expected response to be a <:success>, but was <302>

end

end
