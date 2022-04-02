class ProductsController < InheritedResources::Base
  def add_to_cart
    session[:cart] << params[:id]

    # redirect_back(fallback_location: root_path)

    redirect_back(fallback_location: root_path)
  end

  private

  def product_params
    params.require(:product).permit(:name, :designer, :size, :description, :price, :category_id,
                                    :image)
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @products = Product.where("name LIKE ?", wildcard_search)
  end
end
