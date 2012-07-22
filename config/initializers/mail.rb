if Rails.env == 'production' then
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp

elsif Rails.env == 'development' then
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => "app5795628@heroku.com",
  :password       => "aqhvp7hv",
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp

else 
ActionMailer::Base.delivery_method = :test
end
