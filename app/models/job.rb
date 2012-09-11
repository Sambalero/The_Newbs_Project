# == Schema Information
#
# Table name: jobs
#
#  id                  :integer          not null, primary key
#  client_name         :string(255)
#  client_email        :string(255)
#  description         :text
#  initial_date        :datetime
#  task_list_complete  :datetime
#  proposal_date       :datetime
#  proposer            :string(255)
#  acceptance_date     :datetime
#  proposal_amount     :integer
#  responsible_partner :string(255)
#  master              :string(255)
#  status              :string(255)
#  percent_complete    :integer
#  member              :string(255)
#  completion_date     :datetime
#  contract_amount     :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  job_name            :string(255)
#  comments            :text
#  attachment          :string(255)
#  binary_attachment   :binary
#

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
