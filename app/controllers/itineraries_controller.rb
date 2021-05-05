class ItinerariesController < ApplicationController
    before_action :find_destination, only: [:new, :index, :create]
    
    def index
        # @destination = current_user.destinations.find_by(id: params[:destination_id])
        @itineraries = Itinerary.trips_itineraries(current_user, @destination)
    end


    def show
        #only render if logged in and belongs to user
        #order activities by time with scope method
        @itinerary = Itinerary.find_by(id: params[:id])
        @activities = @itinerary.activities
    end
   
    def new
        @itinerary = @destination.itineraries.build
        8.times {@itinerary.activities.build}
    end

    def create
        @itinerary = @destination.itineraries.build(itinerary_params)
        @itinerary.user_id = session[:user_id]
        if @itinerary.save
            redirect_to destination_itinerary_path(@destination, @itinerary)
        else
            render :new
        end
    end

    def edit
        @itinerary = Itinerary.find_by(id: params[:id])
        8.times {@itinerary.activities.build}
    end

    def update
        @itinerary = Itinerary.find_by(id: params[:id])
        @itinerary.update(itinerary_params)
        if @itinerary.valid?
            redirect_to destination_itineraries_path(@itinerary.destination, @itinerary)
        else
            render :edit
        end
        #find itinerary
        #if @itinerary.update(params)
        
    end

    def destroy
        @itinerary = Itinerary.find_by(id: params[:id])
        @itinerary.destroy
        
        redirect_to destination_itineraries_path(@itinerary.destination)
    end

    def destroy_all
        current_user.itineraries.destroy_all
        redirect_to destinations_path
    end

    private

    def itinerary_params
        params.require(:itinerary).permit(:date, :destination_id, :user_id, activities_attributes: [:id, :time, :description])
    end



end
