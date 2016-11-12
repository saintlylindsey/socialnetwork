class AddCommentTimeToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :comment_time, :datetime
  end
end
