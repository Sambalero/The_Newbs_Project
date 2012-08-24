class TimecardsController < ApplicationController
  # GET /timecards
  # GET /timecards.json
  def index
    @timecards = Timecard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timecards }
    end
  end

  # GET /timecards/1
  # GET /timecards/1.json
  def show
    @timecard = Timecard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timecard }
    end
  end

  # GET /timecards/new
  # GET /timecards/new.json
  def new
    @timecard = Timecard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timecard }
    end
  end

  # GET /timecards/1/edit
  def edit
    @timecard = Timecard.find(params[:id])
  end

  # POST /timecards
  # POST /timecards.json
  def create
    @timecard = Timecard.new(params[:timecard])

    respond_to do |format|
      if @timecard.save
        format.html { redirect_to @timecard, notice: 'Timecard was successfully created.' }
        format.json { render json: @timecard, status: :created, location: @timecard }
      else
        format.html { render action: "new" }
        format.json { render json: @timecard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /timecards/1
  # PUT /timecards/1.json
  def update
    @timecard = Timecard.find(params[:id])

    respond_to do |format|
      if @timecard.update_attributes(params[:timecard])
        format.html { redirect_to @timecard, notice: 'Timecard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @timecard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timecards/1
  # DELETE /timecards/1.json
  def destroy
    @timecard = Timecard.find(params[:id])
    @timecard.destroy

    respond_to do |format|
      format.html { redirect_to timecards_url }
      format.json { head :no_content }
    end
  end
end
