class AddIntroductionToClothes < ActiveRecord::Migration[5.2]
  def change
    add_column :clothes, :introduction, :string
    
  end
end
