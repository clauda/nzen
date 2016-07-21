class Category < ApplicationRecord
  include Elasticsearch::Model
  include Sluggable
  has_many :services
  
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }

  scope :active, -> { where(published: true).order(:name) }
end
