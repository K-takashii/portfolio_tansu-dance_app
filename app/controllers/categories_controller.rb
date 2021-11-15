class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @clothes = @category.clothes
    @categories = Category.all
  end
end
