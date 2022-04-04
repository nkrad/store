class ProductsController < InheritedResources::Base
  helper_method :cart

  def add_to_cart
    session[:cart] << params[:id]

    # redirect_back(fallback_location: root_path)

    redirect_back(fallback_location: root_path)
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    category_search = params[:category]

    # @products = Product.where("name OR description LIKE ?", wildcard_search)
    @products = if category_search == "All"
                  Product.where("name OR description LIKE ?", wildcard_search)

                else
                  Product.where("name OR description LIKE ? AND category_id LIKE ?",
                                wildcard_search, category_search)
                end
  end

  private

  def product_params
    params.require(:product).permit(:name, :designer, :size, :description, :price, :category_id,
                                    :image)
  end
end
