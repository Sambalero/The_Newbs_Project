require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    @job = jobs(:one)
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post :create, job: { 
        acceptance_date: @job.acceptance_date,
        client_email: @job.client_email, 
        client_name: @job.client_name, 
        completion_date: @job.completion_date, 
        contract_amount: @job.contract_amount, 
        description: @job.description, 
        initial_date: @job.initial_date, 
        master: @job.master, 
        member: @job.member, 
        percent_complete: @job.percent_complete, 
        proposal_amount: @job.proposal_amount, 
        proposal_date: @job.proposal_date, 
        proposer: @job.proposer, 
        responsible_partner: @job.responsible_partner, 
        status: @job.status, 
        task_list_complete: @job.task_list_complete }
    end
  end  
end
