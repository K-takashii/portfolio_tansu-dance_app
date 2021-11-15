class AddCategoryIdToClothes < ActiveRecord::Migration[5.2]
  def change
    add_column :clothes, :category_id, :integer
  end
end
