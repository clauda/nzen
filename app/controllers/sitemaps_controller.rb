class SitemapsController < ApplicationController

  def index
    @categories = Category.search("*", where: { published: true, primary: false }, per_page: 2000)
    @districts = District.search("*", per_page: 200)
    respond_to { |format| format.xml }
  end

  def services
    @services = Service.search("*", where: { published: true }, per_page: 10000)
    respond_to { |format| format.xml }
  end

  def district
    @district = District.find(params[:id])
    @categories ||= Category.search("*", where: { published: true, primary: false }, per_page: 2000)
    respond_to { |format| format.xml }
  end

end
