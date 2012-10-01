class VisitorsController < ApplicationController
  skip_before_filter :login_required
  layout "application"
  def front
  end

  def thank_you
  end

  def welcome #delete this? add others?
  end
end
