require 'test_helper'

class AdminIntegrationTest < ActionDispatch::IntegrationTest
  fixtures :users #:all

  test "Admins can log in" do
    visit login_path 

      fill_in 'email', :with => users(:one).email
      fill_in 'password', :with => "password"
      click_button 'Log In'

    assert page.has_content? ("Admin")
  end  
end
  # test "admin-only paths are not accessible to members, clients, and masters" do
  #   assert
  # end

  # test "admin-only paths require log in" do
  #   assert
  # end

  # test "admin can update users' info" do
  #   assert
  # end

  # test "admin can update users' hidden fields" do
  #   assert
  # end

