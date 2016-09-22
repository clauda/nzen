class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show]

  # GET /cities
  # GET /cities.json
  def index
    @users = User.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
