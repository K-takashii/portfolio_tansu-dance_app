class ClothesController < ApplicationController
  def top
    @clothes = Clothe.all
  end

  def new
    @clothe = Clothe.new
    @categories = Category.all
  end

  def index
    @clothes = Clothe.all
  end

  def show
    @clothes = Clothe.find(params[:id])
  end

  def create
    clothe = Clothe.new(clothe_params)
    clothe.user_id = current_user.id
    clothe.save
    redirect_to clothes_path(clothe.id)
  end

  def edit
    @clothes = Clothe.find(params[:id])
  end

  def update
    clothe = Clothe.new(clothe_params)
    clothe.update(clothe_params)
    redirect_to clothe_path(cloth.id)
  end

  private
  def clothe_params
    params.require(:clothe).permit(
    :user_id,
    :clothe_id,
    :category_id,
    :name,
    :introduction,
    :shop_name,
    :image,
    :size)
  end

end
