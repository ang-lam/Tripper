class ItinerariesController < ApplicationController

    def show
        @itinerary = Itinerary.find_by(id: params[:id])
        @activities = @itinerary.activities
    end
   
    def new
        @destination = Destination.find_by(id: params[:destination_id])
        @itinerary = @destination.itineraries.build
        @itinerary.activities.build
        # 8.times {@itinerary.activities.build}
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

        # @destination = Destination.find_by(id: params[:destination_id])
        # @itinerary = @destination.itineraries.build(itinerary_params)
        # @itinerary.user_id = session[:user_id]
        # if @itinerary.save
        #     itinerary_params[:activities_attributes].each do |activity|
        #         binding.pry
        #         if activity[1][:time] != "" && activity[1][:description] != ""
        #             @activity = @itinerary.activities.build(activity[1])
        #             if @activity.save
        #                 next
        #             end
        #         end
        #     end
        # else
        #     render :new
        # end
        # redirect_to destination_itinerary_path(@destination, @itinerary)
        # @itinerary = @destination.itineraries.build(itinerary_params)
        #try to have two buttons:
        # 1. submits and renders the itinerary page
        # 2. submits and brings you back to new page
        
        # or 

        # on destination page create an itinerary with x number of activities

    end

    private

    def itinerary_params
        params.require(:itinerary).permit(:date, :destination_id, :user_id, activities_attributes: [:time, :description])
    end

end
