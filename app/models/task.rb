# == Schema Information
#
# Table name: tasks
#
#  id               :integer          not null, primary key
#  task_name        :string(255)
#  job_name         :string(255)
#  description      :text
#  member           :string(255)
#  master           :string(255)
#  hours            :float
#  skill            :string(255)
#  start_date       :datetime
#  completion_date  :datetime
#  status           :string(255)
#  percent_complete :integer
#  comments         :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :comments, :completion_date, :description, :hours, :job_name, :master, :member, :percent_complete, :skill, :start_date, :status, :task_name
end
