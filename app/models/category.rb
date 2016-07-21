class Category < ApplicationRecord
  include Sluggable
  
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }

  scope :active, -> { where(published: true).order(:name) }
end
