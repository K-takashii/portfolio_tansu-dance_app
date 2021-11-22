class Clothe < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :size, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many  :tag_maps, dependent: :destroy
  has_many  :tags, through: :tag_maps

  attachment :image
  
  def self.clothes_serach(search)
   Clothe.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  end

  def save_clothe(tag_list)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    old_tags.each do |old|
      self.tag_maps.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_clothe_tag = Tag.find_or_create_by(name: new)
      new_tag_map = TagMap.new(clothe_id: self.id,tag_id:new_clothe_tag.id)
      self.tag_maps << new_tag_map
    end
  end
end
