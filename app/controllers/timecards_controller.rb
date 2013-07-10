class TimecardsController < ApplicationController
  before_filter :partner_required
  
  def index # GET /timecards
    @timecards = Timecard.all
  end

  def show # GET /timecards/1
    @timecard = Timecard.find(params[:id])
  end

  def summary
    timecard_names = Timecard.all.collect(&:name).uniq
    @summation = []
    @total_net_hours = 0
    @total_hours = 0
    timecard_names.each do |n|
      hours = Timecard.where("name = ?", n).sum(:hours)

       cards = Timecard.where("name = ?", n)

        net = 0
        cards.each do |card|
          net += card.hours * card.rate
        end      
      @summation << [n, hours, net]
      @total_net_hours += net
      @total_hours += hours   
    end
  end 

  def new # GET /timecards/new
    @timecard = Timecard.new
  end

  def edit # GET /timecards/1/edit
    @timecard = Timecard.find(params[:id])
  end

  def create # POST /timecards
    @timecard = Timecard.new(params[:timecard])
    if @timecard.save
      AdminMailer.time_notice(@timecard).deliver
      AdminMailer.time_confirmation(@timecard).deliver
      redirect_to @timecard, notice: 'Timecard was successfully created.' 
    else
      render action: "new" 
    end
  end
  
  def update # PUT /timecards/1
    @timecard = Timecard.find(params[:id])    
    if @timecard.update_attributes(params[:timecard])
      redirect_to @timecard, notice: 'Timecard was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy # DELETE /timecards/1
    @timecard = Timecard.find(params[:id])
    @timecard.destroy
    redirect_to timecards_url 
  end
end
