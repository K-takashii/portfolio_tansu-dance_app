class RenameMicropost < ActiveRecord::Migration[5.2]
  def change
    #remove_index :tag_maps, column: [:micropost_id, :tag_id]
    #remove_reference :tag_maps, :micropost

    #add_reference :tag_maps, :clothe
    #add_index :tag_maps, [:clothe_id,:tag_id],unique: true
  end
end
