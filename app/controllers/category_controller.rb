class CategoryController < ApplicationController
  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
  end
end
