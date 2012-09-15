# /app/controllers/siteindex_controller.rb


class SiteindexController < ApplicationController
skip_before_filter :login_required
layout "siteindex"


  def show
  end


end