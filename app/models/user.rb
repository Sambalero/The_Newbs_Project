class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name
end
