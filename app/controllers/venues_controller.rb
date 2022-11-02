class VenuesController < ApplicationController
    def show
        @venue = Venue.find params[:index] 
    end
end