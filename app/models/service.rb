class Service < ApplicationRecord
  include Sluggable
  searchkick
  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :district
  has_many :reviews

  mount_uploader :logo, LogoUploader

  validates :name, :phone, :category_id, :district_id, presence: true
  validates :name, :permalink, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_nil: true, allow_blank: true

  scope :active, -> { where(published: true, deleted: false).order(:name) }

  def search_data
    { name: self.name,
      permalink: self.permalink,
      category_permalink: self.category.permalink,
      district_permalink: self.district.permalink,
      category_id: self.category.id,
      district_id: self.district.id,
      description: self.description,
      published: self.published,
      phone: self.phone }
  end

end
