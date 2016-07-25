class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.string :permalink
      t.boolean :published, default: true
      t.boolean :primary, default: false

      t.timestamps
    end

    add_index :categories, :name
    add_index :categories, :permalink
  end
end
