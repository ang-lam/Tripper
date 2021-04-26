class DestinationsController < ApplicationController
    def new
        @destination = Destination.new
    end

    def show
        @destination = Destination.find_by(id: params[:id])
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
        
        redirect_to root_path
    end

    private

    def destination_params
        params.require(:destination).permit(:city, :state, :country)
    end
end
