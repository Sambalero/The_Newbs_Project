require 'test_helper'

class MemberIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    visit login_path
    fill_in 'email', :with => users(:two).email
    fill_in 'password', :with => "password"
    click_button 'Log In'
  end

  test "Members can log in" do

    assert page.has_content?("Logged in!")
  end

  test "Members can't go to admin page" do
    visit admin_path

    assert page.has_content?("We're sorry, but something went wrong.")
  end
end
