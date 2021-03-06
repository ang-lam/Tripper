class ItinerariesController < ApplicationController
    before_action :find_destination, only: [:new, :index, :create]
    before_action :find_itinerary, only: [:show, :edit, :update, :destroy]
    before_action :not_logged_in?, only: [:index, :show, :new, :edit]
    
    def index
        @itineraries = Itinerary.trips_itineraries(current_user, @destination).order_itineraries
    end


    def show
        @activities = Activity.order_activities(@itinerary)
    end
   
    def new
        @itinerary = @destination.itineraries.build
        activities_build
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
        activities_build
    end

    def update
        @itinerary.update(itinerary_params)
        if @itinerary.save
            redirect_to destination_itineraries_path(@itinerary.destination, @itinerary)
        else
            render :edit
        end        
    end

    def destroy
        @itinerary.destroy 
        redirect_to destination_itineraries_path(@itinerary.destination)
    end

    def destroy_all
        itineraries = Itinerary.trips_itineraries(current_user, params[:destination_id])
        itineraries.destroy_all
        redirect_to destinations_path
    end

    private

    def itinerary_params
        params.require(:itinerary).permit(:date, :destination_id, :user_id, activities_attributes: [:id, :time, :description, :_destroy])
    end

    def find_itinerary
        @itinerary = Itinerary.find_by(id: params[:id])
    end

    def activities_build
        8.times {@itinerary.activities.build}
    end

end
