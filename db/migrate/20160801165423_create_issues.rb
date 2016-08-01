class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.references :service
      t.string :reason
      t.text :message
      t.string :status
      t.string :name
      t.string :email
      t.string :code
      t.text :observation

      t.timestamps
    end
  end
end
