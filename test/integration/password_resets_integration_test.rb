require 'test_helper'

class PasswordResetsIntegrationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "can visit reset page" do
    visit login_path
    fill_in 'email', :with => users(:two).email #user2 is member
    fill_in 'password', :with => "otherword"
    click_button 'Log In' 
    click_link 'Forgotten password?'


    assert page.has_content?("Reset Password")
  end

  test "Reset sends email" do
    visit login_path
    fill_in 'email', :with => users(:three).email
    fill_in 'password', :with => "otherword"
    click_button 'Log In' 
    click_link 'Forgotten password?'
    fill_in 'email', :with => users(:three).email
    click_button "Reset Password"

    assert page.has_content?("Email sent with password reset instructions.")
  end

  test "Email is sent" do
    visit login_path
    fill_in 'email', :with => users(:two).email
    fill_in 'password', :with => "otherword"
    click_button 'Log In' 
    click_link 'Forgotten password?'
    fill_in 'email', :with => users(:two).email
    click_button "Reset Password"

    assert ActionMailer::Base.deliveries.last.to[0] == users(:two).email
  end
end
