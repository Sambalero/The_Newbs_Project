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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "attachment is added on create" do
    mock_file = mock()
    mock_file.expects(:original_filename).returns("file-name")
    params = {attached_file: mock_file}
    j = Job.new params
    j.save!
    assert_equal "file-name", j.attachment
  end
end
