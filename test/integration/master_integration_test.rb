require 'test_helper'

class MasterIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    visit login_path
    fill_in 'email', :with => users(:four).email
    fill_in 'password', :with => "password"
    click_button 'Log In'
  end

  test "Masters can log in" do

    assert page.has_content?("Logged in!")
  end

  test "Masters can't go to admin page" do
    visit admin_path

    assert page.has_content?("We're sorry, but something went wrong.")
  end

  test "Masters can't edit jobs directly" do
    visit jobs_path

 
  end
end
