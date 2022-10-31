class VenuesController < ApplicationController
    def show
        database_info = HTTParty.get "https://app.ticketmaster.com/discovery/v2/events?apikey=rDwbiCu00wsFFtXlNb7oOckZAW0qWUDY&locale=*&dmaId=701&genreId=KnvZfZ7vAvF" 
        @venue_info = database_info["_embedded"]["events"][params[:index].to_i]["_embedded"]["venues"][0]
    end
end