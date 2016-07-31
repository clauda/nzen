class AddLikesToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :like, :boolean
    add_column :reviews, :unlike, :boolean
  end
end
