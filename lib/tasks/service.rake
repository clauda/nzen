require 'csv'

namespace :service do
  desc "Load services from file"
  task :seed => :environment do
    city = City.find_or_create_by(name: "Natal", state: "RN")
    CSV.foreach(Rails.root.join("db","data","services-merged.csv")) do |row|
      category = Category.find_or_create_by!(name: row[1], primary: false)
      district = District.find_or_create_by!(name: row[2], city: city)
      Service.find_or_create_by!(name: row[0], category: category, district: district, phone: row[3], address: row[4], zipcode: row[5])
    end
  end
end
