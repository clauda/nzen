class Admin::AdminController < ActionController::Base
  before_action :authenticate_user! #TODO: authenticate_admin
  layout "admin"
end
