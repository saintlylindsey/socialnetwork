class CreatePostsCats < ActiveRecord::Migration[5.0]
  def change
    create_table :posts_cats do |t|
      t.integer :post_id
      t.integer :cat_id

      t.timestamps
    end
    add_index :posts_cats, :post_id
    add_index :posts_cats, :cat_id
  end
end
