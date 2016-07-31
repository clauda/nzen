class City < ApplicationRecord
  include Sluggable
  has_many :districts

  validates :name, :state, presence: true

  scope :active, -> { where(published: true).order(:name) }

  def slug_me
    self.update(permalink: "#{self.name.parameterize}-#{self.state.parameterize}")
  end
end
