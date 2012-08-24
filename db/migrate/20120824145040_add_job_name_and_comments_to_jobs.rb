class AddJobNameAndCommentsToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :job_name, :string
  	add_column :jobs, :comments, :text
  end
end
