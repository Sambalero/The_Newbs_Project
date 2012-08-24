class Job < ActiveRecord::Base
  attr_accessible :acceptance_date, :client_email, :client_name, :completion_date, :contract_amount, :description, :initial_date, :master, :member, :percent_complete, :proposal_amount, :proposal_date, :proposer, :responsible_partner, :status, :task_list_complete
end
