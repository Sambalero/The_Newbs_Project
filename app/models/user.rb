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

class User < ActiveRecord::Base
	has_secure_password
	before_create { generate_token(:auth_token) }
  before_save { |user| user.email = email.downcase }
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }, :if => :should_validate_password?
	validates :password_confirmation, presence: true, :if => :should_validate_password?
	attr_protected
# move :if to after attribute? 
#  attr_accessible :role, :email, :name, :approval, 
#  								:password, :password_confirmation
  attr_accessor :update_password

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  AdminMailer.password_reset(self).deliver
	end

  def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end
	
	def should_validate_password?
		@update_password || new_record?
	end
end
