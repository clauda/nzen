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
      services_count: self.services_count }
  end
end
