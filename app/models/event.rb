class Event < ApplicationRecord
    has_and_belongs_to_many :artists
    belongs_to :venues, :optional => true
    has_many :attendances

        # the method below imports the event data from the ticketmaster API into the event model
    def self.import_event (hash)
        event = Event.find_by :ticket_id => hash["id"]
        if event.nil?
            event = Event.new
            event.ticket_id = hash["id"]
            event.name = hash["name"]
            event.image = hash["images"][1]["url"]
            event.date = hash["dates"]["start"]["localDate"]
            event.city = hash["_embedded"]["venues"][0]["city"]["name"]
            event.state = hash["_embedded"]["venues"][0]["state"]["name"]
            event.save
            if hash.dig("_embedded", "attractions").present?
                hash["_embedded"]["attractions"].each do |attraction|
                    artist = Artist.import_artist(attraction) unless attraction.dig("externalLinks", "spotify").nil?
                    event.artists << artist unless artist.nil?
                end
            end
        end
        event
    end
end