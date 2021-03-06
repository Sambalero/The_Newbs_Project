require 'test_helper'

class ClientIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    visit login_path
    fill_in 'email', :with => users(:five).email
    fill_in 'password', :with => "password"
    click_button 'Log In'
  end

  test "Clients can log in" do

    assert page.has_content?("Logged in!")
  end

  test "Clients can't go to admin page" do
    visit admin_path

    assert page.has_content?("We're sorry, but something went wrong.")
  end
 
end
