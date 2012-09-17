# == Schema Information
#
# Table name: timecards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  task        :string(255)
#  description :text
#  hours       :float
#  date        :datetime
#  rate        :float
#  approved    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  email       :string(255)
#

class Timecard < ActiveRecord::Base
  attr_accessible :approved, :date, :description, :hours, 
                  :name, :rate, :task, :email



end
