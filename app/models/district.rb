class District < ApplicationRecord
  include Sluggable
  has_many :services
  
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }
end
