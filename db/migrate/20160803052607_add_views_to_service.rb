class AddViewsToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :views, :integer, default: 0
  end
end
