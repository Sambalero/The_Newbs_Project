class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :client_name
      t.string :client_email
      t.text :description
      t.datetime :initial_date
      t.datetime :task_list_complete
      t.datetime :proposal_date
      t.string :proposer
      t.datetime :acceptance_date
      t.integer :proposal_amount
      t.string :responsible_partner
      t.string :master
      t.string :status
      t.integer :percent_complete
      t.string :member
      t.datetime :completion_date
      t.integer :contract_amount

      t.timestamps
    end
  end
end
