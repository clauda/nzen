module ServicesHelper

  def numbers_only number
    number.gsub(/[^\d]/, '')
  end

  def service_class_for service
    return 'danger' if service.deleted?
    return 'warning' if service.banned?
    return 'active' unless service.published?
  end

end
