require 'test_helper'

class AdminCommentsIntegrationTest < ActionDispatch::IntegrationTest

  test "Admins can visit comments edit page" do
    visit login_path
    fill_in 'email', :with => users(:one).email
    fill_in 'password', :with => "password"
    click_button 'Log In' 
    visit comments_path

    assert page.has_content?("OK?")
  end

  test "Admins can update comments" do
    visit login_path
    fill_in 'email', :with => users(:one).email
    fill_in 'password', :with => "password"
    click_button 'Log In'
    visit comments_path
    page.all('a', :text =>"EDIT")[1].click
    check 'Approved'
    click_button 'Update Comment'

    assert page.has_content?("Comment was successfully updated.")
  end

  test "Visitors can't see private comment fields" do
   visit root_path
    if page.has_content?("Sign Out") then 
      click_link("Sign Out") 
    end
    assert page.has_content?("Sign In")
    visit comments_path
    refute page.has_content?("Approved?")
  end

  test "Visitors can't update comments" do
   visit root_path
    if page.has_content?("Sign Out") then 
      click_link("Sign Out") 
    end
    assert page.has_content?("Sign In")

    visit '/comments/1/edit'
    assert page.has_content?("We're sorry, but something went wrong.")
  end

  # test "Admin can publish comments" do
  #   visit login_path
  #   fill_in 'email', :with => users(:one).email
  #   fill_in 'password', :with => "password"
  #   click_button 'Log In'

  #   visit comments path
  #   assert page.has_content?("Comment was successfully updated.")

  # end

  #visitor can't (NoMethodError)
end
