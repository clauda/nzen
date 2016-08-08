class RemoteController < ApplicationController
  
  def categories
    @categories = Category.children.order(:name)
    respond_to { |format| format.json }
  end

  def districts
    @districts = District.all.order(:name)
    respond_to { |format| format.json }
  end

  def report_error
    @issue = Issue.new(issue_params)
    @issue.status = "new"
    @issue.save
    respond_to { |format| format.json }
  end

  private

    def issue_params
      params.require(:issue).permit(:service_id, :name, :email, :reason, :message)
    end

end
