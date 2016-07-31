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
      services_count: self.services_count }
  end
end
