class VenuesController < ApplicationController
    # venue index
    def show
        @venue = Venue.find params[:index] 
    end
end