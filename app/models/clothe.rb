class Clothe < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :users, dependent: :destroy  
  belongs_to :tag_map
end
