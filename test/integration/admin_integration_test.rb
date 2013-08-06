require 'test_helper'

class AdminIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    visit login_path
    fill_in 'email', :with => users(:one).email
    fill_in 'password', :with => "password"
    click_button 'Log In'
  end    

  test "Admins can visit comments edit page" do 
    visit comments_path

    assert page.has_content?("OK?")
  end

  test "Admins can update comments" do
    visit comments_path
    page.all('a', :text =>"EDIT")[1].click
    check 'Approved'
    click_button 'Update Comment'

    assert page.has_content?("Comment was successfully updated.")
  end

  test "Admins can delete comments" do
    visit comments_path
    assert page.has_content?("MyText1") 
    click_button( 'DELETE1' )
    assert page.has_content?("Admin")   
  
    refute page.has_content?("MyText1")  
  end
end