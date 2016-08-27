class Service < ApplicationRecord
  include Sluggable
  searchkick
  belongs_to :user, optional: true
  belongs_to :category, counter_cache: true
  belongs_to :district, counter_cache: true
  has_one :city, through: :district
  has_many :reviews
  has_many :issues

  mount_uploader :logo, LogoUploader

  validates :name, :phone, :category_id, :district_id, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_nil: true, allow_blank: true

  scope :active, -> { where(published: true, deleted: false).order(:name) }
  scope :waiting, -> { where(published: false) }
  scope :latest, -> { where("created_at > ?", (Date.today - 30.days)) }

  def search_data
    { name: self.name,
      permalink: self.permalink,
      category_permalink: self.category.permalink,
      district_permalink: self.district.permalink,
      category_name: self.category.name,
      district_name: self.district.name,
      city_name: self.district.city.name,
      category_id: self.category.id,
      district_id: self.district.id,
      category_parent_id: self.category.parent.try(:id),
      description: self.description,
      published: self.published,
      phone: self.phone }
  end

  def category_parent
    self.category.parent
  end

  def full_address
    "#{self.address} - #{self.district.name}"
  end

  def increment_view!
    self.update_column(:views, self.views + 1)
  end

  private

    # Move to a background job 
    def reindexes
      self.category.reindex
      self.reindex
      # Rails.cache.clear
    end

end
