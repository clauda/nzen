require 'net/http'

namespace :utils do
  desc "Ping Google"
  task :ping => :environment do
    District.all.each do |district|
      ping("http://pinou.com.br/sitemaps/#{district.id}.xml")
    end
  end

  def ping(url)
    uri = URI("http://www.google.com/webmasters/sitemaps/ping")
    params = { sitemap: url }
    uri.query = URI.encode_www_form(params)
    puts "Ping #{uri}"
    puts `curl -IL #{uri}`
  end

  desc "Cache clear"
  task :cache => :environment do
    Rails.cache.clear
  end
end
