class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :title
      t.text :description
      t.string :arrival_time
      t.integer :team_id

      t.timestamps
    end
  end
end
