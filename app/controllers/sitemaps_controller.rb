class SitemapsController < ApplicationController
  respond_to :xml

  def index
    @categories = Category.search("*", where: { published: true, primary: false }, per_page: 2000)
    @districts = District.search("*", per_page: 200)
  end

  def services
    @services = Service.search("*", where: { published: true }, per_page: 10000)
  end

  def district
    @district = District.find(params[:id])
    @categories ||= Category.search("*", where: { published: true, primary: false }, per_page: 2000)
  end

end
