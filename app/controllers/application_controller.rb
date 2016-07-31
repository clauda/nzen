class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_city

  def current_city
    @current_city ||= @service.try(:city) || @district.try(:city) || City.by_slug(params[:city_id]) || City.first
  end
end
