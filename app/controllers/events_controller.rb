class EventsController < ApplicationController
    def show 
        @info = HTTParty.get "https://app.ticketmaster.com/discovery/v2/events?apikey=rDwbiCu00wsFFtXlNb7oOckZAW0qWUDY&locale=*&dmaId=701&genreId=KnvZfZ7vAvF" 
        @event_info = @info["_embedded"]["events"]
        @event = @event_info.filter.with_index do |e, index|
            @event_index = index if e['id'] == params[:id]
            e['id'] == params[:id]
        end.first
        # @event = Event.find params[:id]
    end

    def attend
        @event = Event.find params[:id]
        @current_user.attendances
        @current_user.save
        redirect_to event
    end

end