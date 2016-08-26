class IssueMailer < ApplicationMailer
  default from: 'contato@pinou.com.br'
 
  def received issue
    @issue = issue
    mail(to: @issue.email, subject: 'Recebemos o seu contato')
  end
end
