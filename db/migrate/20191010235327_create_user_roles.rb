class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.integer :user_id
      t.integer :role_id
      t.integer :assigner_id
      t.datetime :date_assigned
      t.boolean :confirmed, default: false


      t.timestamps
    end
  end
end
