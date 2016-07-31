class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.boolean :published, default: false
      t.string :permalink

      t.timestamps
    end
    add_index :cities, :name
    add_index :cities, :permalink
  end
end
