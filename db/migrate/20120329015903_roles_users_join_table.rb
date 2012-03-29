class RolesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :roles_users do |t|
      t.references :user, :role
    end
    add_index :roles_users, [:user_id, :role_id]
  end
end
