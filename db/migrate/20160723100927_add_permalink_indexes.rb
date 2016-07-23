class AddPermalinkIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :categories, :permalink
    add_index :districts, :permalink
    add_index :services, :permalink
  end
end
