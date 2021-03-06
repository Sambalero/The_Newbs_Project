# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  approval               :boolean          default(FALSE)
#  password_digest        :string(255)
#  role                   :string(255)
#  mail                   :string(255)
#  telephone              :string(255)
#  comment                :text
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  PHP                    :integer
#  Ruby_on_rails          :integer
#  Javascript             :integer
#  HTML                   :integer
#  CSS                    :integer
#  Flash                  :integer
#  jquery                 :integer
#  MySQL                  :integer
#  Postgresql             :integer
#  GitHub                 :integer
#  WordPress              :integer
#  Graphics               :integer
#  Video                  :integer
#  Audio                  :integer
#  Adobe_photoshop        :integer
#  Gimp                   :integer
#  SEO                    :integer
#  SEM                    :integer
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

  test "won't save without email" do

    assert !@baduser.save
  end

  test "will save with email" do
    @baduser.email = "bad@good.com"

    assert @baduser.save
  end

  test "won't save without password" do
    @baduser.password = ""

    assert !@baduser.save
  end

  test "won't save if password and confirmation don't match" do
    @baduser.password = "password"

    assert !@baduser.save
  end

  test "won't save without password confirmation" do
    @baduser.password_confirmation = ""
  
    assert !@baduser.save
  end

  test "validates presence of email & password" do
  	assert_equal true, @user.valid?
   	assert_equal false, @baduser.valid?
   	assert_equal false, @baduser2.valid?
  end

  test "won't save with duplicate email" do
    @dupuser.email = @user.email

     assert !@dupuser.save
  end   

  test "validates unique email" do
  	@dupuser.save

  	assert_equal false, @dupuser.valid?
  end

  test "should downcase email addresses" do
  	assert_equal "user@example.com", @user.email
  end


  test "if password & confirmation match" do
  	@user.password_confirmation = "otherword"
  	assert_equal false, @user.valid?
  	@user.password_confirmation = "longword"
  	assert_equal true, @user.valid?
  end

  test "password and confirmation are not nil" do
  	assert @user.valid?

  	assert_equal false,  @user.password_confirmation.blank?
  end

  test "password is not blank" do
  	assert @user.valid?

  	assert_equal false, @user.password.blank?
  end

  test "generates unique password password_reset_tokens" do
    @user.send_password_reset
    last_token = @user.password_reset_token
    @user.send_password_reset

    assert @user.password_reset_token != last_token
  end

  test "saves time reset was sent" do
    @user.send_password_reset

    assert @user.password_reset_sent_at
  end


end 
