class DestinationsController < ApplicationController
    before_action :not_logged_in?, only: [:index, :new]
    
    def index
        @destinations = current_user.destinations.uniq.sort_by { |d| d.city}
    end

    def new
        @top_destinations = Destination.popular_trips
        @destination = Destination.new
        @destinations = Destination.alphabetize_destinations
    end
    
    def create
        @destination = Destination.find_by(id: destination_params[:id])
        @destinations = Destination.all
        if @destination
            redirect_to destination_itineraries_path(@destination)
        else
            @destination = Destination.new(destination_params)
            if @destination.save
                redirect_to destination_itineraries_path(@destination)
            else
                render :new
            end
        end
    end

    private

    def destination_params
        params.require(:destination).permit(:city, :state, :country, :id)
    end
end
