class Job < ActiveRecord::Base
  attr_accessible :acceptance_date, :client_email, :client_name, 
                  :completion_date, :contract_amount, :description, 
                  :initial_date, :master, :member, :percent_complete, 
                  :proposal_amount, :proposal_date, :proposer, 
                  :responsible_partner, :status, :task_list_complete, 
                  :attachment, :binary_attachment, :attached_file
  attr_accessor :attached_file

 
  before_save do
    if attached_file
      self.binary_attachment = attached_file.read
      self.attachment = attached_file.original_filename
    end
  end
end
