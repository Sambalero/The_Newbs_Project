require 'test_helper'

class PasswordResetsIntegrationTest < ActionDispatch::IntegrationTest

  setup do
  end

  test "can visit reset page" do
    visit login_path
    fill_in 'email', :with => users(:two).email
    fill_in 'password', :with => "otherword"
    click_button 'Log In' 
    click_link 'Forgotten password?'


    assert page.has_content?("Reset Password")
  end


end
