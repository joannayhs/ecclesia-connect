class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.integer :user_id
      t.integer :role_id
      t.integer :assigner
      t.datetime :date_assigned

      t.timestamps
    end
  end
end
