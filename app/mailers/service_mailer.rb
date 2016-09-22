class ServiceMailer < ApplicationMailer

  def published service
    @service = service
    if @service.user
      to = %("#{@service.user.name}" <#{@service.user.email}>)
      mail(to: to, subject: 'Seu negócio está no ar!')
    end
  end
end
