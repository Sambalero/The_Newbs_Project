base_url = "http://#{request.host_with_port}" #what is this if not the first part of the xml.loc?
xml.instruct! :xml, :version=> '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  @routes.each do |route|
    xml.url {
      xml.loc("http://www.noobs.herokuapp.com#{route}")
      xml.changefreq("monthly")
    }
  end
  
  # @posts.each do |post|
  #   xml.url {
  #     xml.loc("http://www.mysite.com/posts/#{post.name.to_s}")
  #     xml.changefreq("daily")
  #   }
  # end

end