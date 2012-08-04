class UsersController < ApplicationController
  before_filter :admin_required, except: [:update_password]
  before_filter :admin_or_self, only: [:update_password]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /join
  def join
    @title = "Sign Up Form"
# add skills    @content = "Please include a brief description of your skill set:"
    @note = "We may request additional information."
    @source = "join" #Is this needed?
    @button_label = "Sign Me Up!"
    @user = User.new
    render "users/new"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
logger.debug "in create ---------------------------------->"

    @user = User.new(params[:user])
logger.debug @user.inspect
    if @user.save
logger.debug "user saved----------------------------------->"
      redirect_to @user, notice: 'User was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url 
  end
end
