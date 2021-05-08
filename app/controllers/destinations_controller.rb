class DestinationsController < ApplicationController
    before_action :all_destinations, only: [:new, :create]
    before_action :not_logged_in?, only: [:index, :new]
    
    def index
        @destinations = current_user.destinations.uniq
        # @destinations = Destination.users_trips(current_user)
    end

    def show
        #scope method? - dont need this action? 
        @destination = Destination.find_by(id: params[:id])
        @itineraries = Itinerary.trips_itineraries(current_user, @destination)
    end

    def new
        @top_destinations = Destination.popular_trips
        @destination = Destination.new
    end
    
    def create
        @destination = Destination.find_by(id: destination_params[:id])
        if @destination
            redirect_to destination_path(@destination)
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

    def all_destinations
        @destinations = Destination.all
    end
end
