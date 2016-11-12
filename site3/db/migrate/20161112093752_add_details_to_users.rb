class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string
  	add_column :users, :birthday, :date
  	add_column :users, :aboutyou, :text
  end
end
