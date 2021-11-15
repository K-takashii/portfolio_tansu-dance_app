class Tag < ApplicationRecord
  has_many   :tag_maps, dependent: :destroy
  has_many   :clothes, through: :tag_maps
  validates :name, uniqueness: true
end
