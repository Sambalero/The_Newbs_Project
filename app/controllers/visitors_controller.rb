class VisitorsController < ApplicationController
  skip_before_filter :login_required
  def home
  end

  def thank_you
  end

  def welcome #delete this? add others?
  end
end
