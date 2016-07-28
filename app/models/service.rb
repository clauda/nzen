class Service < ApplicationRecord
  include Sluggable
  searchkick
  belongs_to :user, optional: true
  belongs_to :category, counter_cache: true
  belongs_to :district, counter_cache: true
  has_many :reviews

  mount_uploader :logo, LogoUploader

  validates :name, :phone, :category_id, :district_id, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_nil: true, allow_blank: true

  scope :active, -> { where(published: true, deleted: false).order(:name) }

  after_create :reindexes

  def search_data
    { name: self.name,
      permalink: self.permalink,
      category_permalink: self.category.permalink,
      district_permalink: self.district.permalink,
      category_name: self.category.name,
      district_name: self.district.name,
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

  private

    # Move to a background job 
    def reindexes
      self.category.reindex
      self.reindex
      # Rails.cache.clear
    end

end
