require 'net/http'

namespace :utils do
  desc "Ping Google"
  task :ping => :environment do |t, args|
    District.all.each do |district|
      ping("http://localhost:3000/sitemaps/#{district.id}.xml")
    end
  end

  def ping(url)
    uri = URI("http://www.google.com/webmasters/sitemaps/ping")
    params = { sitemap: url }
    uri.query = URI.encode_www_form(params)
    puts "Ping #{url}"
    Net::HTTP.get(URI(url))
    # Net::HTTP.get(uri)
  end
end
