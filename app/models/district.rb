class District < ApplicationRecord
  include Sluggable
  
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }
end
