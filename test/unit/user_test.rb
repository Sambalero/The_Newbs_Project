# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  approval        :boolean          default(FALSE)
#  password_digest :string(255)
#  role            :string(255)
#  mail            :string(255)
#  telephone       :string(255)
#  comment         :text
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase


  setup do
    @user = User.new(name: "Example User", email: "user@Example.com", password: "longword", password_confirmation: "longword" )
    @baduser = User.new(name: "Example User", email: "", password: "longword", password_confirmation: "longword" )
    @baduser2 = User.new(name: "Example User", email: "mmm", password: "", password_confirmation: "longword" )
    @dupuser = User.new(name: "Example User", email: "user@Example.com", password: "longword", password_confirmation: "longword" )
    @user.save
  end

  test "has basic attributes" do 
  	assert(@user.name && @user.email && @user.password)
  end

  test "validates presence of email & password" do
  	assert_equal true, @user.valid?
   	assert_equal false, @baduser.valid?
   	assert_equal false, @baduser2.valid?
  end

  test "requires unique email" do
  	@dupuser.save
  	assert_equal false, @dupuser.valid?
  end

  test "should downcase email addresses" do
  	assert_equal "user@example.com", @user.email
  end

  test "if password & confirmation don't match" do

  end

  test "if password & confirmation match" do
  	@user.password_confirmation = "otherword"
  	assert_equal false, @user.valid?
  	@user.password_confirmation = "longword"
  	assert_equal true, @user.valid?
  end

  test "password and confirmation are not nil" do
  	assert @user.valid?

  	@user.password = @user.password_confirmation = nil
  	assert_equal false, @user.valid?
  end

  test "password and confirmation are not blank" do
  	assert @user.valid?

  	@user.password = @user.password_confirmation = " "
  	assert_equal false, @user.valid?
  end



  # test "can be deactivated" do
  # end

end
