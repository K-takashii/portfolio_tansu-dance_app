class Clothe < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :size, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many  :tag_maps, dependent: :destroy
  has_many  :tags, through: :tag_maps

  attachment :image

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.clothe_tags.delete ClotheTag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_clothe_tag = ClotheTag.find_or_create_by(tag_name: new)
      self.clothe_tags << new_clothe_tag
    end
  end
end
