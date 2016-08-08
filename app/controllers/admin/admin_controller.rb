class Admin::AdminController < ActionController::Base
  before_action :authenticate_user!
  before_filter do 
    redirect_to(root_url, alert: 'Acesso Negado') unless current_user && current_user.admin?
  end
  layout "admin"
end
