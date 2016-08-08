class AccountController < ApplicationController
  before_action :authenticate_user!

  def index
    @services = current_user.services
    @issues = current_user.issues
  end

end
