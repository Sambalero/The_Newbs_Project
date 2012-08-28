class UsersController < ApplicationController
  before_filter :admin_required, except: [:update_password, :join ]
  before_filter :admin_or_self, only: [:update_password]
  skip_before_filter :login_required, only: [ :join, :create ]

#it would be nice to double check email if format seems invalid. See h33 for regex  

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /join
  def join #clean this up!
    @title = "Sign Up Form"
# add skills    @content = "Please include a brief description of your skill set:"
    @note = "We may request additional information."
    @source = "join" #Is this needed?
    @button_label = "Sign Me Up!"
    @user = User.new
    @update_password = true
    render "users/new"
  end

  # GET /users/new
  def new
    @update_password = true
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @admin = true #confirm this is needed/correct
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to root_path, notice: "You have been listed as a new #{@user.role}. An email will be sent to you shortly." 
      AdminMailer.join_notice(@user).deliver

    else
      render action: "new" 
    end
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'Your #{@user.role} information was successfully updated.' 
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
