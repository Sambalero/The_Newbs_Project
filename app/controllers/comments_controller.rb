class CommentsController < ApplicationController
  skip_before_filter :login_required
  before_filter :admin_required, only: [:edit, :update, :destroy]
  
  def index # GET /comments
    @comments = Comment.all
    if !current_user || current_user.role != "admin"
      @comments.delete_if {|comment| !comment.approved}
      @comments.delete_if {|comment| comment.source == "hire"}
      @comments.delete_if {|comment| comment.source == "join"}
    end
  end
  
  def show # GET /comments/:id
    @comment = Comment.find(params[:id])
  end
  
  def new # GET /comments/new
    @title = @title || "Comment Form"
    @note = @note || ""
    @button_label = @button_label || "Submit Comment"
    @comment = Comment.new
  end

  def create # POST /comments
    @comment = Comment.new(params[:comment])
    if @comment.save
      AdminMailer.comment_notice(@comment.notice("Noobs Comment Posted")).deliver 
      redirect_to @comment, notice: "Comment logged." 
    else
      AdminMailer.comment_notice(@comment.notice("comment creation attempted")).deliver
      render action: "new" 
    end
  end

  def edit # GET /comments/:id/edit
    @comment = Comment.find(params[:id])
  end

  def update # PUT /comments/:id
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      AdminMailer.comment_notice(@comment.notice("comment updated")).deliver
      redirect_to @comment, notice: 'Comment was successfully updated.' 
    else
       AdminMailer.comment_notice(@comment.notice("comment update attempted")).deliver
      render action: "edit" 
    end
  end
  
  def destroy # DELETE /comments/:id
    @comment = Comment.find(params[:id])

    @comment.destroy
    AdminMailer.comment_notice(@comment.notice("comment destroyed")).deliver
    redirect_to comments_url
  end
end
