class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:nombre)
    end

end
