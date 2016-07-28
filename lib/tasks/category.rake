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
    categories = Category.where(primary: false, parent_id: nil)
    puts "#{categories.size} orphans! Find my dad:"
    categories.each do |category|
      puts "##{category.id} '#{category.name}' have #{category.services.size} services."
      category.update(primary: true) if category.services.empty?
    end
  end

  desc "Reset Services Counters"
  task :update_counters => :environment do |t, args|
    Category.find_each { |record| Category.reset_counters(record.id, :services) }
    Category.reindex
  end
end
