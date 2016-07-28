xml.instruct!

xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do

  @categories.each do |category|
    cache "#{category.permalink}-on-#{@district.permalink}" do
      xml.url do
        xml.loc district_url(@district, category)
        xml.changefreq("weekly")
        xml.priority "0.8"
      end
    end
  end

end