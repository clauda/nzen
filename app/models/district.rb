class District < ApplicationRecord
  include Sluggable
  searchkick
  has_many :services
  belongs_to :city
  
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }
  validates :city_id, presence: true

  def search_data
    { name: self.name,
      permalink: self.permalink,
      city_id: self.city.id,
      city_name: self.city.name,
      services_count: self.services_count,
      first_char: self.name[0] }
  end

  def self.for(conditions = {})
    self.search('*', where: conditions, order: 'name', per_page: 100, aggs: { first_char: { order: { "_term" => "asc" }}})
  end

  def fullpath
    "#{self.name} - #{self.city.name}/#{self.city.state}"
  end

end
