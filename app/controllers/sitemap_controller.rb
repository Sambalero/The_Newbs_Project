# /app/controllers/sitemap_controller.rb
# from http://blog.dynamic50.com/2010/09/09/creating-a-sitemap-for-rails-and-heroku/

class SitemapController < ApplicationController
  respond_to :xml
  caches_page :show

  def show
#    @posts = Post.all
# future: ?add priority?
    @routes = ["/",                       
											"/visitors/welcome",
											"/visitors/how_it_works",
											"/visitors/thank_you",
											"/visitors/help_wanted",
											"/comments",
											"/sitemap"]
    respond_to do |format|
      format.xml
    end
  end

# future: add send method to update search engines. ?on change? ?track frequency? 
end