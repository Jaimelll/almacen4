class ParametersController < InheritedResources::Base

  private

    def parameter_params
      params.require(:parameter).permit(:empresa)
    end

end
