class Category < ApplicationRecord
  include Sluggable
  searchkick
  belongs_to :parent, class_name: 'Category'
  has_many :children, class_name: 'Category', foreign_key: :parent_id
  has_many :services

  scope :active, -> { where(published: true).order(:name) }
  scope :masters, -> { active.where(primary: true) }

  def search_data
    { name: self.name,
      permalink: self.permalink,
      parent_id: self.parent_id,
      published: self.published,
      primary: self.primary,
      services_count: self.services_count,
      services_total: self.services_total,
      first_char: self.name[0] }
  end

  def services_total
    self.primary ? self.children.sum(:services_count) : self.services_count
  end

end
