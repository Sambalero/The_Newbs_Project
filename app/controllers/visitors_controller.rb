class VisitorsController < ApplicationController
  skip_before_filter :login_required
  layout :resolve_layout
  def front
  end

  def thank_you
  end

  def welcome 
  end

  private
    def resolve_layout
      case action_name
        when 'welcome'
          'welcome'
        when 'front'
          'front'
        else
          'visitors'
      end
    end
end
