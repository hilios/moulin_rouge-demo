class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.text :body
      t.boolean :is_approved, :default => false

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
