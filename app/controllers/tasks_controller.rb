class TasksController < ApplicationController

  

  def index # GET /tasks
    @tasks = Task.all
  end

  def show # GET /tasks/1
    @task = Task.find(params[:id])
  end

  def new # GET /tasks/new
    @task = Task.new
  end
  
  def edit # GET /tasks/1/edit
    @task = Task.find(params[:id])
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
end
