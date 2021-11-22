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
    if params[:search].present?
      @clothes = Clothe.clothes_serach(params[:search])
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @clothes = @tag.clothes.order(created_at: :desc)
    else
      @clothes = Clothe.all.order(created_at: :desc)
    end
    @tag_list = Tag.all
    @tops_clothes = Category.find(5).clothes
    @outer_clothes = Category.find(7).clothes
    @bottom_clothes = Category.find(8).clothes
    @clothe = current_user.clothes.new
  end

  def show
    @clothe = Clothe.find(params[:id])
    @clothe_tags = @clothe.tags
  end

  def create
    clothe = current_user.clothes.build(clothe_params)
    tag_list = params[:clothe][:tag_ids].delete(' ').delete('　').split(',')
    #clothe.image.attach(params[:clothe][:image])
    clothe.user_id = current_user.id
    if clothe.save
      clothe.save_clothe(tag_list)
      redirect_to clothes_path(clothe.id)
    else
      flash.now[:alert] = '投稿に失敗しました'
      redirect_back(fallback_location: root_path)
    end
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

  def seach
    @tag_list = Tag.all
    @tag = Tag.find(params[tag_ids])
    @clothes = @tag.clothes.all
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
