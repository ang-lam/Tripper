class DestinationsController < ApplicationController
    def index
        @destinations = current_user.destinations.uniq
        # @destinations = Destination.users_trips(current_user)
    end

    def show
        #scope method?
        @destination = Destination.find_by(id: params[:id])
        @itineraries = Itinerary.trips_itineraries(current_user, @destination)
    end

    def new
        @top_destinations = Destination.popular_trips
        @destinations = Destination.all
        @destination = Destination.new
    end
    
    def create
        @destinations = Destination.all
        @destination = Destination.find_by(id: destination_params[:id])
        if @destination
            redirect_to destination_path(@destination)
        else
            @destination = Destination.new(destination_params)
            if @destination.save
                redirect_to destination_path(@destination)
            else
                render :new
            end
        end
    end

    def destroy
        @destination = Destination.find_by(id: params[:destination_id])
        @destination.destroy
        
        redirect_to destinations_path
    end

    private

    def destination_params
        params.require(:destination).permit(:city, :state, :country, :id)
    end
end
