class Comment < ActiveRecord::Base
  attr_accessible :approved, :comment, :contact, :name
end