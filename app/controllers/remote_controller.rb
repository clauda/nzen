class RemoteController < ApplicationController
  before_action :fetch_service, only: [:report_error, :like, :dislike, :add_review_comment]
  before_action :fetch_review, only: [:like, :dislike, :add_review_comment]
  
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

  def like
    @review.update_columns(like: true, unlike: false) if @review
    respond_to { |format| format.json }
  end

  def dislike
    @review.update_columns(like: false, unlike: true) if @review
    respond_to { |format| format.json }
  end

  def add_review_comment
    @review.update_column(:comment, params[:review][:comment]) if @review
  end

  private

    def fetch_review
      @review = current_user.reviews.find_or_create_by(service_id: @service.id) if current_user
    end

    def fetch_service
      @service = Service.by_slug(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:service_id, :name, :email, :reason, :message)
    end

end
