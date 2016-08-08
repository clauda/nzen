class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_city

  def current_city
    @current_city ||= @service.try(:city) || @district.try(:city) || City.by_slug(params[:city_id]) || City.first
  end

  def after_sign_in_path_for resource
    sign_in_url = new_user_session_path
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
end
