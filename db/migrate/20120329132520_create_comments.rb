class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.string :from
      t.text :message
      t.boolean :approved, :default => false

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
