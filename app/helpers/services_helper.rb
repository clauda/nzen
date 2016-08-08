module ServicesHelper

  def numbers_only number
    number.gsub(/[^\d]/, '')
  end

end
