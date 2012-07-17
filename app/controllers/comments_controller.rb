class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    @comments.delete_if {|comment| !comment.approved}
    @comments.delete_if {|comment| comment.source == "hire"}
    @comments.delete_if {|comment| comment.source == "join"}


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json

  def join
    @title = "Sign Up Form"
    @content = "My Skill Set"
    @note = "We may request additional information."
    @source = "join"
    @button_label = "Sign Me Up!"
    @comment = Comment.new
    render "comments/new"
  end

  def hire
    @title = "Job Request"
    @content = "Job Description"
    @note = "We may request additional information."
    @source = "hire"
    @button_label = "Send Job Request"
    @comment = Comment.new
    render "comments/new"
  end

  def new
    @title = @title || "Comment Form"
    @content = @content|| "Comment"
    @note = @note || ""
    @source = @note || "comment"
    @button_label = @button_label || "Submit Comment"
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create

    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    AdminMailer.comment_added(params[:comment]).deliver
  end


  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
