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

Rails::logger.debug "******************************************"
Rails::logger.debug "page.all('a')"
Rails::logger.debug "#{page.all('a', :text => 'EDIT').inspect}"
Rails::logger.debug "******************************************" 

    assert page.has_content? ("OK?")
  end

# within(".comment") do
#   click_on("View")
# end

# page.all('a')[1].click
# page.find("a:eq(2)").click
# if(page.find("a")[:href] == "comment")
#     click_on("View")


  # test "should update comment" do
  #   put :update, id: @comment1, comment: { approved: @comment1.approved, comment: @comment1.comment, contact: @comment1.contact, name: @comment1.name }
  #   assert_redirected_to comment_path(assigns(:comment))
  # end

  # test "admin can get to edit user page" do
  #    visit users_path
  #    page.find('#edit2').click  

  #    assert page.has_content? ("Editing user")
  #  end 

  # test "admin can update users' info" do
  #    visit users_path
  #    page.find('#edit2').click
  #    fill_in 'user_name', :with => "Kidzo"
  #    click_button 'Update User' 

  #    assert page.has_content? ('Your  information was successfully updated.')
  #    assert page.has_content? ("Name: Kidzo")
  #  end 

  # test "admin can un-approve user" do
  #    visit users_path
  #    page.find('#edit2').click
  #    uncheck 'user_approval'
  #    click_button 'Update User' 

  #    assert User.find_by_id(2).approval==false
  #  end 

  #  test "admin can create user" do
  #    visit users_path
  #    click_link 'New User' 
  #    fill_in 'user_name', :with => "Io"
  #    fill_in 'user_email', :with => 'email'
  #    fill_in 'user_password', :with => 'password'
  #    fill_in 'user_password_confirmation', :with => 'password'
  #    click_button 'Create User'

  #    assert page.has_content? ('New user created') 
  #  end

  #  test "admin must be approved" do
  #    @disapproved = users(:five)
  #    visit login_path
  #    fill_in 'email', :with => @disapproved.email
  #    fill_in 'password', :with => 'password'
  #    click_button 'Log In'

  #    assert page.has_content? ('Log In')
  #  end
end
