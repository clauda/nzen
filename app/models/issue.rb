class Issue < ApplicationRecord
  belongs_to :service
  validates :reason, :email, presence: true
  validates :code, uniqueness: true

  after_create :generate_protocol
  after_create :notice

  REASONS = {
    claim: "Sou dono(a) desta Empresa",
    no_aswer: "Não atendem no número informado",
    closed: "Empresa Inativa/Fora de funcionamento",
    mistake: "Erro nas informações",
    abuse: "Anúncio maldoso ou com conteúdo impróprio",
    normal: "Simples Contato"
  }

  STATUSES = {
    new: "Novo",
    in_progress: "Em andamento",
    done: "Concluído"
  }

  private

    def generate_protocol
      code = self.service ? "PIN#{self.id.to_s.rjust(5, '0')}-S#{self.service.id.to_s.rjust(7, '0')}" : "PIN#{self.id.to_s.rjust(5, '0')}-NOSERVICE"
      self.update(code: code)
    end

    def notice
      IssueMailer.received(self).deliver_now
    end

end
