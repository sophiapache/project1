class Venue < ApplicationRecord
    has_many :events

        # the method below imports the venue data from the ticketmaster API into the venue model
    def self.import_venue (hash)
            venue = Venue.new
            venue.name = hash["_embedded"]["venues"][0]["name"]
            venue.location = hash["_embedded"]["venues"][0]["city"]["name"]
            venue.address = hash["_embedded"]["venues"][0]["address"]["line1"]
            venue.image = hash["_embedded"]["venues"][0]["images"][0]["url"] unless hash["_embedded"]["venues"][0]["images"].nil?
            venue.save
        venue
    end
end
