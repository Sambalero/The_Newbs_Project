class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :job_name
      t.text :description
      t.string :member
      t.string :master
      t.float :hours
      t.string :skill
      t.datetime :start_date
      t.datetime :completion_date
      t.string :status
      t.integer :percent_complete
      t.text :comments

      t.timestamps
    end
  end
end
