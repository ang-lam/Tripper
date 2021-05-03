class ItinerariesController < ApplicationController
    
    def index
        # @destination = current_user.destinations.find_by(id: params[:destination_id])
        destination = Destination.find_by(id: params[:destination_id]) if params[:destination_id]
        @itineraries = Itinerary.trips_itineraries(current_user, destination)
    end


    def show
        #only render if logged in and belongs to user
        @itinerary = Itinerary.find_by(id: params[:id])
        @activities = @itinerary.activities
    end
   
    def new
        @destination = Destination.find_by(id: params[:destination_id])
        @itinerary = @destination.itineraries.build
        8.times {@itinerary.activities.build}
    end

    def create
        @destination = Destination.find_by(id: params[:destination_id])
        @itinerary = @destination.itineraries.build(itinerary_params)
        @itinerary.user_id = session[:user_id]
        if @itinerary.save
            redirect_to destination_itinerary_path(@destination, @itinerary)
        else
            render :new
        end
    end

    def update
        #find itinerary
        #if @itinerary.update(params)
    end

    def destroy
        @itinerary = Itinerary.find_by(id: params[:id])
        @itinerary.destroy
        
        redirect_to destination_itineraries_path(@itinerary.destination)
    end

    private

    def itinerary_params
        params.require(:itinerary).permit(:date, :destination_id, :user_id, activities_attributes: [:time, :description])
    end

end
