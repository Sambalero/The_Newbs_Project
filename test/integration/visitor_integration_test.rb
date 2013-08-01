require 'test_helper'

class VisitorIntegrationTest < ActionDispatch::IntegrationTest

  test "Visitors can't log in" do
    visit login_path
    fill_in 'email', :with => "email@host.com"
    fill_in 'password', :with => "password"
    click_button 'Log In' 

    assert page.has_content?("Log in failed.")
  end

  test "Visitors can't go to admin page" do
    visit admin_path

    assert page.has_content?('Log In')
  end
end
