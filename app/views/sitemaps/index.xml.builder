xml.instruct!

xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  xml.url do
    xml.loc root_url
    xml.changefreq("hourly")
    xml.priority "1.0"
  end
  
  @categories.each do |resource|  
    cache resource.permalink do
      xml.url do
        xml.loc category_url(resource)
        xml.changefreq("daily")
        xml.priority "0.8"
        xml.lastmod resource.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
      end
    end
  end

  @districts.each do |resource|  
    cache resource.permalink do
      xml.url do
        xml.loc district_url(resource)
        xml.changefreq("weekly")
        xml.priority "0.8"
      end
    end
  end

end