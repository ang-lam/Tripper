class ApplicationController < ActionController::Base
    include ApplicationHelper

    def home
        redirect_if_logged_in
    end

    private

    def find_destination
        @destination = Destination.find_by(id: params[:destination_id])
    end

    def redirect_if_logged_in
        if logged_in?
            redirect_to destinations_path
        end
    end

    def not_logged_in?
        if !logged_in?
            redirect_to root_path
        end
    end
end
