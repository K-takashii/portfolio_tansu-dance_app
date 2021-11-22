class CategoriesController < ApplicationController
  def index
    pp params
    if params[:serch_word]
      @clothes = Clothe.left_joins(:tags).where("clothes.name like ? or tags.name like ?", "%#{params[:serch_word]}%", "%#{params[:serch_word]}%").page(params[:page]).per(9).distinct
      # idが一致していてもしてなくてもleft_joinsはくっつける
      # clotheモデルとtagsモデルをjoinすることで一度に検索できるようになる
      # clotheモデルとtagsモデルの中から、whereの内容であるclothes.nameか

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
    @category = Category.find(params[:id])
    @category_title = @category.name
    @categories = Category.all
    @clothes = Clothe.where("category_id=?", params[:id])
  end
end
