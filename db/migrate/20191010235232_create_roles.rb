class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :title
      t.text :description
      t.datetime :arrival_time
      t.integer :team_id, null: false
      t.integer :min_users, default: 1
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
