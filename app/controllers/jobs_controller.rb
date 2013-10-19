class JobsController < ApplicationController
  skip_before_filter :login_required, only: [:new, :create]
  before_filter :partner_required, only: [:edit]

  
  def index # GET /jobs
    @jobs = Job.all
  end
 
  def show # GET /jobs/1
    @job = Job.find(params[:id])
  end
 
  def new # GET /jobs/new
    @job = Job.new
  end

  def edit # GET /jobs/1/edit
    @job = Job.find(params[:id])
  end

  def create # POST /jobs
    @job = Job.new(params[:job])
    if @job.save
      AdminMailer.job_notice(@job).deliver
      redirect_to @job, notice: 'Job was successfully created.' 
    else
      render action: "new" 
    end
  end

  def update # PUT /jobs/1
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to @job, notice: 'Job was successfully updated' 
    else
      render action: "edit" 
    end
  end
  
  def destroy # DELETE /jobs/1
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url 
  end
end
