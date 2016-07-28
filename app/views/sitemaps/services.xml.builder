xml.instruct!

xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do

  @services.each do |resource|
    cache resource.permalink do
      xml.url do
        xml.loc business_url(resource)
        xml.changefreq("weekly")
        xml.priority "0.8"
      end
    end
  end

end