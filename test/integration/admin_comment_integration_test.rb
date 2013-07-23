require 'test_helper'

class AdminCommentsIntegrationTest < ActionDispatch::IntegrationTest
  fixtures :users 
  fixtures :comments

  setup do
    @admin = users(:one)
    visit login_path
    fill_in 'email', :with => @admin.email
    fill_in 'password', :with => "password"
    click_button 'Log In'
  end

  test "Admins can visit comments edit page" do
    visit comments_path

    assert page.has_content? ("OK?")
  end

  test "Admins can unapprove comments" do
    visit comments_path
    page.all('a', :text =>"EDIT")[1].click
    uncheck 'Approved'
    click_button 'Update Comment'

    assert page.has_content? ("Comment was successfully updated.")
  end
end
