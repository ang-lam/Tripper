class DestinationsController < ApplicationController
    def new
    end

    def show
    end
    
    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def destination_params
        params.require(:destination).permit(:city, :country)
    end
end
