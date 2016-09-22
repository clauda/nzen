class IssueMailer < ApplicationMailer

  def received issue
    @issue = issue
    mail(to: @issue.email, subject: 'Recebemos o seu contato')
  end
end
