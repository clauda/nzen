class AddCityToDistrict < ActiveRecord::Migration[5.0]
  def change
    add_reference :districts, :city, foreign_key: true
  end
end
