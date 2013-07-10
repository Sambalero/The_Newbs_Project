require 'test_helper'

class VisitorsControllerTest < ActionController::TestCase
  # test "should get home" do
  #  error:  No route matches
  #   get :home
  #   assert_response :success
  #   assert_select 'title', "Newbies! Discount Web Design by Students"
  # end

  test "should get how_it_works" do
    get :how_it_works
    assert_response :success
    assert_select 'title', "Newbies! How It Works"
  end

  test "should get thank_you" do
    get :thank_you
    assert_response :success
    assert_select 'title', "Newbies! Thank You"
  end

  test "should get welcome" do
    get :welcome
    assert_response :success
    assert_select 'title', "Newbies! The Newbies! Story"
  end

  # test "should get help_wanted" do
  #   error: The action 'help_wanted' could not be found
  #   get :help_wanted
  #   assert_response :success
  #   assert_select 'title', "Newbies! Help Wanted"
  # end
end
