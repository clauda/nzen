class AddServiceCountToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :services_count, :integer
    add_column :districts, :services_count, :integer
  end
end
