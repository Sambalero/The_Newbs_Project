class Task < ActiveRecord::Base
  attr_accessible :comments, :completion_date, :description, :hours, :job_name, :master, :member, :percent_complete, :skill, :start_date, :status, :task_name
end
