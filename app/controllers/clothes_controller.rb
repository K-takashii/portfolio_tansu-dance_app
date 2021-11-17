class ClothesController < ApplicationController
  def top
    @clothes = Clothe.all
  end

  def new
    @clothe = Clothe.new
    @categories = Category.all
    @sizes = Size.all
  end

  def index
    @tag_list = Tag.all
    @clothes = Clothe.all
    @clothe = current_user.clothes.new
  end

  def show
    @clothe = Clothe.find(params[:id])
    @clothe_tags = @clothe.tags
  end

  def create
    clothe = current_user.clothes.build(clothe_params)
    tag_list = params[:clothe][:tag_ids].delete(' ').delete('　').split(',')
    clothe.user_id = current_user.id
    if clothe.save
      clothe.save_clothe(tag_list)
      redirect_to clothes_path(clothe.id)
    else
      redirect_back(fallback_location: root_path)
    end

    # このままではタグを保存して紐づかせる処理が無いので実装する必要がある
    # 1. にゅうりょく　されたタグを区切り文字で分解しよう
    # 2. モデルメソッドでタグを保存して紐づける処理を実装仕様
    # 3. clothe.2で実装したメソッド(tag_list)で処理を呼び出して実行させよう
  end

  def edit
    @clothes = current_user.clothes.find(params[:id])
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end

  def update
    clothe = Clothe.new(clothe_params)
    clothe.update(clothe_params)
    redirect_to clothe_path(cloth.id)
  end

  private
  def clothe_params
    params.require(:clothe).permit(
    :category_id,
    :name,
    :introduction,
    :shop_name,
    :image,
    :size_id,
    :store_name)
  end

end
