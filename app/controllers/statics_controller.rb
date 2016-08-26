class StaticsController < ApplicationController
  def terms; end
  def politics; end
  def faq; end
  
  def contact
    @issue = Issue.new
    if params[:issue]
      @issue = Issue.new(issue_params)
      @issue.reason = "normal"
      @issue.status = "new"
      @issue.save
      flash[:notice] = "Obrigado por entrar em contato conosco. Recebemos sua solicitação e iremos responder em breve."
    end
  end

  private

    def issue_params
      params.require(:issue).permit(:name, :email, :message)
    end

end
