class TasksController < ApplicationController
  before_filter :partner_required, only: [:new, :create]
  before_filter :master_required, only: [:update, :edit]
  before_filter :special_require, only: [:index, :show]



# partner, admin can create
# assigned master can update status, percent complete and comments
# member has to report progress on time card?

  

  def index # GET /tasks
    @tasks = Task.all
  end

  def show # GET /tasks/1
    @task = Task.find(params[:id])
    if current_user.role == 'master' then render "public/403.html" unless current_user.name  == @task.master end
    if current_user.role == 'client' then render "public/403.html" unless current_user.name  == @task.client end     
  end

  def new # GET /tasks/new
    @task = Task.new
  end
  
  def edit # GET /tasks/1/edit
    @task = Task.find(params[:id])
    if current_user.role == 'master' then render "public/403.html" unless current_user.name  == @task.master end
  end

  def create # POST /tasks
    @task = Task.new(params[:task])
    if @task.save
      redirect_to @task, notice: 'Task was successfully created'
    else
      render action: "new"
    end
  end

  def update # PUT /tasks/1
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task, notice: 'Task was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy # DELETE /tasks/1
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url 
  end

  def special_require
    render "public/403.html" unless current_user && (current_user.role == 'partner') || (current_user.role == 'admin') || (current_user.role == 'master') || (current_user.role == 'client') 
  end

end
