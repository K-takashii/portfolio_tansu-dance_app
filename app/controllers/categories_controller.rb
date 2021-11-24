class CategoriesController < ApplicationController
  def index
    pp params
    if params[:serch_word]
      @clothes = Clothe.left_joins(:tags).where("clothes.name like ? or tags.name like ?", "%#{params[:serch_word]}%", "%#{params[:serch_word]}%").page(params[:page]).per(9).distinct
      @category_title = params[:serch_word]
      @categories = Category.all
      @tag_list = Tag.all
    else
      @category_title = "全アイテム"
      @categories = Category.all
      @clothes = Clothe.all.page(params[:page]).per(9)
      @tag_list = Tag.all
    end
  end

  def show
    pp params
    if params[:serch_word]
      @clothes = Clothe.left_joins(:tags).where("clothes.name like ? or tags.name like ?", "%#{params[:serch_word]}%", "%#{params[:serch_word]}%").page(params[:page]).per(9).distinct
      @category_title = params[:serch_word]
      @categories = Category.all
      @tag_list = Tag.all
    else
      @category = Category.find(params[:id])
      @category_title = @category.name
      @categories = Category.all
      @clothes = Clothe.where(category_id: @category).page(params[:page]).per(9)
      @tag_list = Tag.all
    end
  end
end
