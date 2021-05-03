class DestinationsController < ApplicationController
    def index
        # @destinations = current_user.destinations.uniq
        @destinations = Destination.users_trips(current_user)
    end

    def show
        @destination = Destination.find_by(id: params[:id])
    end

    def new
        @top_destinations = Destination.popular_trips
        @destination = Destination.new
    end
    
    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            redirect_to destination_path(@destination)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
        @destination = Destination.find_by(id: params[:id])
        @destination.destroy
        
        redirect_to destinations_path
    end

    private

    def destination_params
        params.require(:destination).permit(:city, :state, :country)
    end
end
