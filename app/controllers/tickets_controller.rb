class TicketsController < InheritedResources::Base

  private

    def ticket_params
      params.require(:ticket).permit(:title, :body, :user_id)
    end

end
