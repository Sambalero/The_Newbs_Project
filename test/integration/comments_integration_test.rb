require 'test_helper'
#class / test works similarly...
#class CommentsIntegrationTest < ActionDispatch::IntegrationTest

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
    assert page.has_content?("Comment Form")

    #approve as admin

  end

    it "starts with a comment" do
    visit login_path
    fill_in 'Email', with: "bille" #this will explode
    fill_in 'Password', with: "password"
    click_link_or_button "Log In"
    visit admin_path
    assert page.has_content?("Log In")

    #disable authorization and confirm what it's doing

  end

end