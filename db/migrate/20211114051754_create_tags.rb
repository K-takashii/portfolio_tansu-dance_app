class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :tag_map_id
      t.string :name
      t.timestamps
    end
  end
end
