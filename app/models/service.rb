class Service < ApplicationRecord
  include Sluggable
  belongs_to :user
  belongs_to :category
  belongs_to :district

  mount_uploader :logo, LogoUploader

  validates :name, :description, :phone, :category_id, :district_id, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  scope :active, -> { where(published: true, deleted: false).order(:name) }
end
