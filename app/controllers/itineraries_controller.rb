class ItinerariesController < ApplicationController

    def show
    end
   
    def new
        @itinerary = Itinerary.new
        8.times {@itinerary.activities.build}

    end

    def create
    end

    private

    def itinerary_params
        params.require(:itinerary).permit(:date, activities_attributes: [:time, :description])
    end

end
