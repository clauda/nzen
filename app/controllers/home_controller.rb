class HomeController < ApplicationController
  
  def index
    @categories = Category.active.group_by { |cat| cat.name[0] }
  end

  def categories
    @categories = Category.search('*', where: { published: true }, order: 'name', per_page: 1000)
    @services = Services::Search.for('*', params[:sort], params[:page], { category_id: params[:id], per_page: 10000 })
  end

  def category
    @category = Category.by_slug(params[:id])
  end

  def districts
    @districts = District.search('*', order: 'name', per_page: 100)
    @services = Services::Search.for('*', params[:sort], params[:page], { category_id: params[:id], per_page: 10000 })
  end

  def district
    @district = District.search('*', where: { permalink: params[:district_id] },
        order: 'name', per_page: 10).results.first
    @category = Category.by_slug(params[:category_id]) if params[:category_id]
    params.merge!({ per_page: 1000 })
    @services = Services::Search.for('*', params[:sort], params[:page], params)
  end
end
