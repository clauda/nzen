module IssuesHelper

  REASONS = [
    ["Não atendem no número informado", "noaswer"],
    ["Empresa Inativa/Fora de funcionamento", "closed"],
    ["Sou dono(a) desta Empresa", "claim"],
    ["Erro nas informações", "mistake"],
    ["Anúncio maldoso ou com conteúdo impróprio", "abuse"]
  ]

  STATUSES = [
    ["Novo", "new"],
    ["Em andamento", "inprogress"],
    ["Concluído", "done"]
  ]

end
