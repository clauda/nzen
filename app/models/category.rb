class Category < ApplicationRecord
  include Sluggable
  searchkick
  has_many :services
  
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }

  scope :active, -> { where(published: true).order(:name) }

  def search_data
    { name: self.name,
      permalink: self.permalink,
      published: self.published,
      services_count: self.services.size }
  end

end
