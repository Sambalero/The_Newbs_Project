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

  test "Members must be approved" do 
    visit login_path
    fill_in 'email', :with => users(:six).email
    fill_in 'password', :with => 'password'
    click_button 'Log In'

    assert page.has_content?('Log In')
  end

  test "Members can't go to admin page" do
    visit admin_path

    assert page.has_content?("We're sorry, but something went wrong.")
  end

  test "Members can't update comments" do
    visit comments_path

    refute page.has_content?("EDIT")
  end

  test "Members can't delete comments" do
    visit comments_path

    assert page.has_content?("MyText2") 
    refute page.has_content?( 'DELETE2' )
  end

  test "Admin-only methods don't work for members" do
    memPath = '/users/'+users(:two).id.to_s+'/edit'
    visit memPath

    refute page.has_content?("EDIT")
  end
end
