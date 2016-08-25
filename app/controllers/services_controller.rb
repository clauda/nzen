class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_dependents, only: [:new, :create, :edit, :update]

  def index
    @districts = District.all.order(:name)
    options = { 
      district_id: params[:districts]
    } if params[:districts]

    @services = Services::Search.for(params[:pesquisa], params[:sort], params[:page], options)
  end

  def show
    @service.increment_view!
    @issue = @service.issues.build
    @review = @service.reviews.build
  end

  def new
    @service = Service.new
  end

  def edit; end

  def create
    @service = Service.new(service_params)
    @service.user = current_user if current_user
    @service.published = false

    respond_to do |format|
      if @service.save
        format.html { redirect_to business_path(@service), notice: 'A empresa foi criada, porém ainda não está no ar e não aparece nos resultados de busca. Se os dados fornecidos estiverem de acordo com os termos de uso, ela poderá entrar no ar em até 48 horas.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to business_path(@service), notice: 'Empresa atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Empresa removida.' }
      format.json { head :no_content }
    end
  end

  def search
    # @services = Services::Search.for(params[:pesquisa], params[:sort], params[:page])
    redirect_to(services_path(pesquisa: params[:pesquisa], districts: params[:district_ids]))
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.includes(:category, :district).by_slug(params[:id])
      render('shared/404', status: :not_found) if @service.nil?
    end

    def set_dependents
      @categories = Category.children
      @districts = District.all.order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :user_id, :category_id, :district_id, :description, :phone, :web, :email, :logo, :address, :facebook, :instagram, :opens, :closes, :zipcode)
    end

end
