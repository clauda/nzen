module IssuesHelper

  REASONS = [
    ["Sou dono(a) desta Empresa", "claim"],
    ["Não atendem no número informado", "noaswer"],
    ["Empresa Inativa/Fora de funcionamento", "closed"],
    ["Erro nas informações", "mistake"],
    ["Anúncio maldoso ou com conteúdo impróprio", "abuse"]
  ]

  STATUSES = [
    ["Novo", "new"],
    ["Em andamento", "in_progress"],
    ["Concluído", "done"]
  ]

  def issue_class_for status
    case status
      when 'new' then 'info'
      when 'in_progress' then 'success'
    end
  end

end
