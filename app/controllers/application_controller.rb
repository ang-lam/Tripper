class ApplicationController < ActionController::Base
    include ApplicationHelper
    #helper_method :method 
    #application helper only for methods that will be used in views as well

    def home
    end

    private

    def find_destination
        @destination = Destination.find_by(id: params[:destination_id])
    end
end
