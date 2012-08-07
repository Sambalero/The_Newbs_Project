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

class User < ActiveRecord::Base
	has_secure_password
  before_save { |user| user.email = email.downcase }
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true 
  attr_accessible :role, :email, :name, :approval, :password, :password_confirmation
end
