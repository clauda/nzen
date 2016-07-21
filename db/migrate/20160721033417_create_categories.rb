class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :published, default: true
      t.string :permalink

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
