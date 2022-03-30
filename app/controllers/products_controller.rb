class ProductsController < InheritedResources::Base
  private

  def product_params
    params.require(:product).permit(:name, :designer, :size, :description, :price, :category_id)
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @products = Product.where("name LIKE ?", wildcard_search)
  end
end
