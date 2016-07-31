module DistrictsHelper

  def find_district id
    District.find(id).try(:name)
  end

end
