class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates_presence_of :password, :on => :create
  attr_accessible :admin, :email, :name, :approval, :password, :password_confirmation
end
