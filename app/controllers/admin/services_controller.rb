class Admin::ServicesController < Admin::AdminController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Services::Search.for(params[:term], params[:sort], params[:page], { is_admin: true})
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.published = false

    respond_to do |format|
      if @service.save
        format.html { redirect_to [:admin,@service], notice: 'Feito! Empresa criada' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to [:admin,@service], notice: 'ok, Empresa atualizada' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to admin_services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def moderate
    @services = Service.waiting
    @services = Services::Search.for(params[:term], params[:sort], params[:page], { is_admin: true, waiting: true })
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :user_id, :category_id, :district_id, :description, :phone, :web, :email, :logo, :address, :facebook, :instagram, :opens, :closes, :zipcode, :published)
    end
end
