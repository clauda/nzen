class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :district, foreign_key: true
      t.text :description
      t.string :permalink
      t.string :phone
      t.string :web
      t.string :email
      t.string :logo
      t.string :address
      t.string :lat
      t.string :lng
      t.string :zipcode
      t.string :facebook
      t.string :instagram
      t.boolean :published, default: true
      t.boolean :premium, default: false
      t.boolean :verified, default: false
      t.boolean :deleted, default: false
      t.boolean :banned, default: false
      t.string :banned_reason
      t.time :opens
      t.time :closes

      t.timestamps
    end

    add_index :services, :name
    add_index :services, :description
    add_index :services, :address
    add_index :services, :zipcode
  end
end
