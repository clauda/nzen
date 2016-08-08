class Review < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :service_id, presence: true
end
