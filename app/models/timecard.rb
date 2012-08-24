class Timecard < ActiveRecord::Base
  attr_accessible :approved, :date, :description, :hours, :name, :rate, :task
end
