# /app/controllers/siteindex_controller.rb


class SitemapsController < ApplicationController
skip_before_filter :login_required
layout "siteindex"


  def show
    # Redirect to CloudFront and S3
    redirect_to "http://d2qncrnfsbjjvn.cloudfront.net/sitemaps/sitemap1.xml.gz"
  end


end

