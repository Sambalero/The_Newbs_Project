require 'test_helper'
#class / test works similarly...
#class CommentsIntegrationTest < ActionDispatch::IntegrationTest
  # setup do ..  # end goes here
describe "comments integration" do
#	test "comments are shown" do
  it "has the right header" do
		visit comments_path
		assert page.has_content?("Commentary")
	end

  it "starts with a comment form" do
    visit new_comment_path
    fill_in 'Name', with: "me"
    fill_in 'Contact', with: "still me"
    fill_in 'Comment', with: "word" 
    visit login_path
    fill_in 'Email', with: "first@newbs.com"
    fill_in 'Password', with: "password"
    click_link_or_button "Log In"
    visit admin_path
    assert page.has_content?("Log In")

    #approve as admin

  end

end