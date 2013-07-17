class UsersController < ApplicationController
  before_filter :admin_required, except: [:update_password, :join, :create, :new ]
  before_filter :admin_or_self, only: [:update_password]
  skip_before_filter :login_required, only: [ :join, :create, :new ]

  def join # GET /join
    @title = "Sign Up Form"
    @button_label = "Sign Me Up!"
    @user = User.new
    @update_password = true
    render "users/new"
  end

  def create   # POST /users

    @user = User.new(params[:user])
    if @user.save && !current_user
      AdminMailer.join_notice(@user).deliver
      redirect_to root_path, notice: "You have been listed as a new user. Your account will take some time to set up. An email will be sent to you when your registration is complete." 
    elsif @user.save 
      redirect_to @user, notice: "New user created: #{@user.name}"
    else
      render action: "new" 
    end
  end

  def new # GET /users/new
    @update_password = true
    @user = User.new
  end

  def edit # GET /users/1/edit
    @user = User.find(params[:id])
        

  end

  def update_password
  end

  def index # GET /users
    @users = User.all
  end

  def show # GET /users/:id
    @user = User.find(params[:id])
  end

  def update # PUT /users/:id
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'Your  information was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy # DELETE /users/:id
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url 
  end

  def admin
  end
end

