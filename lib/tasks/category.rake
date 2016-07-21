namespace :category do
  desc "Load categories from file"
  task :seed => :environment do |t, args|
    file = File.open(Rails.root.join("db","data","categories.csv"), "r") 
    file.each_line do |line|
      Category.create(name: line)
    end
  end
end
