# /app/controllers/front_controller.rb


class FrontController < ApplicationController
skip_before_filter :login_required
layout "front"


  def show
  end


end