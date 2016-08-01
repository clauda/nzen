class Issue < ApplicationRecord
  belongs_to :service
  validates :reason, :message, :email, presence: true

  after_create :generate_protocol

  private

    def generate_protocol
      code = self.service ? "PIN#{self.id.to_s.rjust(5, '0')}-S#{self.service.id.to_s.rjust(7, '0')}" : "PIN#{self.id.to_s.rjust(5, '0')}-NOSERVICE"
      self.update(code: code)
    end

end
