json.extract! issue, :id, :reason, :message, :status, :user_id, :name, :email, :created_at, :updated_at
json.url admin_issue_url(issue, format: :json)