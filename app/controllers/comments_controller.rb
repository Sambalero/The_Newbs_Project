class CommentsController < ApplicationController
 

  # GET /admin
  def admin
    @admin = true
    @comments = Comment.all
    render "comments/index"
  end

  # GET /comments
  def index
    @comments = Comment.all

    @comments.delete_if {|comment| !comment.approved}
    @comments.delete_if {|comment| comment.source == "hire"}
    @comments.delete_if {|comment| comment.source == "join"}

  end

  # GET /comments/:id
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /join
  def join
    @title = "Sign Up Form"
    @content = "My Skill Set"
    @note = "We may request additional information."
    @source = "join"
    @button_label = "Sign Me Up!"
    @comment = Comment.new
    render "comments/new"
  end

  # GET /hire
  def hire
    @title = "Job Request"
    @content = "Job Description"
    @note = "We may request additional information."
    @source = "hire"
    @button_label = "Send Job Request"
    @comment = Comment.new
    render "comments/new"
  end

  # GET /comments/new
  def new
    @title = @title || "Comment Form"
    @content = @content|| "Comment"
    @note = @note || ""
    @source = @note || "comment"
    @button_label = @button_label || "Send Message"
    @comment = Comment.new
  end




  # GET /comments/:id/edit
  def edit
    @admin = true
    @comment = Comment.find(params[:id])
    @content = "content"
  end

  # POST /comments
  def create

    @comment = Comment.new(params[:comment])


    if @comment.save
      AdminMailer.comment_notice(@comment.notice("comment created")).deliver
      redirect_to @comment, notice: 'Comment was successfully created.' 
    else
      AdminMailer.comment_notice(@comment.notice("comment creation attempted")).deliver
      render action: "new" 
    end
  end


  # PUT /comments/1
  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      AdminMailer.comment_notice(@comment.notice("comment updated")).deliver
      redirect_to @comment, notice: 'Comment was successfully updated.' 
    else
       AdminMailer.comment_notice(@comment.notice("comment update attempted")).deliver
      render action: "edit" 
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    AdminMailer.comment_notice(@comment.notice("comment destroyed")).deliver

    redirect_to comments_url
  end



end
