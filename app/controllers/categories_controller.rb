class CategoriesController < ApplicationController
  def index
    @category_title = "全アイテム"
    @categories = Category.all
    @clothes = Clothe.all
    @tag_list = Tag.all
  end
  def show
    @category = Category.find(params[:id])
    @category_title = @category.name
    @categories = Category.all
    @clothes = Clothe.where("category_id=?", params[:id])
  end
end
