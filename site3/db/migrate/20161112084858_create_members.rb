class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.text :aboutyou
      t.date :birthday

      t.timestamps
    end
  end
end
