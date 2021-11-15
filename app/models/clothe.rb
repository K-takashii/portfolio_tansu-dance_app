class Clothe < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many  :tag_maps, dependent: :destroy
  has_many  :tags, through: :tag_maps

  attachment :image

end
