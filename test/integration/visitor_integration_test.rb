require 'test_helper'

class VisitorIntegrationTest < ActionDispatch::IntegrationTest

  setup do
   visit root_path
    if page.has_content?("Sign Out") then 
      click_link("Sign Out") 
    end
  end

  test "Visitors can't log in" do
    visit login_path
    fill_in 'email', :with => "email@host.com"
    fill_in 'password', :with => "password"
    click_button 'Log In' 

    assert page.has_content?("Log in failed.")
  end

  test "Visitors can't go to admin page" do
    visit admin_path

    refute page.has_content?('Admin')
  end

  test "Visitors can't see private comment fields" do
    visit comments_path

    refute page.has_content?("Approved?")
  end

  test "Visitors can't update comments" do
    visit '/comments/1/edit'

    assert page.has_content?("We're sorry, but something went wrong.")
  end
end
