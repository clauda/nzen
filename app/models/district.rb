class District < ApplicationRecord
  include Sluggable
  searchkick
  has_many :services
  
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }

  def search_data
    { name: self.name,
      permalink: self.permalink,
      services_count: self.services.size }
  end
end
