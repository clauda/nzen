class HomeController < ApplicationController
  layout 'application'
  
  def index
    # @categories = Category.masters.group_by { |cat| cat.name[0] }
    @services = Service.active.order(created_at: :desc).limit(10)
    render layout: 'home'
  end

  def categories
    @categories = Category.search('*', where: { primary: true, published: true, services_total: { gt: 0 } }, order: 'name', per_page: 200)
    @services = Services::Search.for('*', params[:sort], params[:page], { category_id: params[:id] })
  end

  def category
    @category = Category.includes(services: [:district]).by_slug(params[:id])
    @services = Services::Search.for('*', params[:sort], params[:page], { category_id: params[:id] })
  end

  def districts
    @city = params[:city_id] ? City.by_slug(params[:city_id]) : current_city
    # @districts = District.for({ city_id: @city.id })
    @districts = District.where(city_id: @city.id).order(:name).group_by { |cat| cat.name[0] }
    @services = Services::Search.for('*', params[:sort], params[:page], { category_id: params[:id] })
  end

  def district
    @city = params[:city_id] ? City.by_slug(params[:city_id]) : current_city
    @district = District.search('*', where: { permalink: params[:district_id] },
        order: 'name', per_page: 10).results.first
    @category = Category.by_slug(params[:category_id]) if params[:category_id]
    # params.merge!({ per_page: 1000 })
    @services = Services::Search.for('*', params[:sort], params[:page], params)
  end
end
