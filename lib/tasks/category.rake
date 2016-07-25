namespace :category do
  desc "Load categories from file"
  task :seed => :environment do |t, args|
    CSV.foreach(Rails.root.join("db","data","categories.csv")) do |row|
      category = Category.find_or_create_by(name: row[0], primary: true)
      category.children.find_or_create_by(name: row[1], primary: false)
    end
  end

  desc "Find orphans"
  task :orphans => :environment do |t, args|
    categories = Category.where(primay: false, parent_id: nil)
    puts "#{categories.size} orphans"
    categories.each do |category|
      if category.services_count && category.services_count <= 0
        category.update(primary: true)
      else
        puts category
      end
    end
  end

  desc "Reset Services Counters"
  task :update_counters => :environment do |t, args|
    Category.find_each { |record| Category.reset_counters(record.id, :services) }
    Category.masters.each { |record| record.update(services_count: record.services_total) }
    Category.reindex
  end
end
