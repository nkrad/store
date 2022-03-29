class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:name, :designer, :size, :description, :price)
    end

end
