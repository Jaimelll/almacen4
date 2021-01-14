class FormulasController < InheritedResources::Base

  private

    def formula_params
      params.require(:formula).permit(:material, :integer)
    end

end
