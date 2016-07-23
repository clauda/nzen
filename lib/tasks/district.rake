namespace :district do
  desc "Load districts from file"
  task :seed => :environment do |t, args|
    file = File.open(Rails.root.join("db","data","districts.csv"), "r") 
    file.each_line do |line|
      District.create(name: line.strip)
    end
  end
end
