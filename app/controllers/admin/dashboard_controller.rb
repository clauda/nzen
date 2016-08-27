class Admin::DashboardController < Admin::AdminController

  def index
    @issues = Issue.opened
    @users = User.all
    @services = Service.waiting
  end

end
