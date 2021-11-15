class CreateTagMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_maps do |t|
      t.references :micropost, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    add_index :tag_maps, [:micropost_id,:tag_id],unique: true
  end
end
