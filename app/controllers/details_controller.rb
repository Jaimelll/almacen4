class DetailsController < InheritedResources::Base

  private

    def detail_params
      params.require(:detail).permit(:descripcion)
    end

end
