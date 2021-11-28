class CreateClothes < ActiveRecord::Migration[5.2]
  def change
    create_table :clothes do |t|
      t.integer :tag_map_id
      t.integer :user_id
      t.string :name
      t.string :store_name
      t.integer :si
      t.timestamps
    end
  end
end
