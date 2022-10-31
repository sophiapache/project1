class PagesController < ApplicationController
    def home
        info = HTTParty.get "https://app.ticketmaster.com/discovery/v2/events?apikey=rDwbiCu00wsFFtXlNb7oOckZAW0qWUDY&locale=*&dmaId=701&genreId=KnvZfZ7vAvF" 
        @event_info = info["_embedded"]["events"]
    end

end
