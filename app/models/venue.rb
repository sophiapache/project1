class Venue < ApplicationRecord
    has_many :events
    def self.import_venue (hash)
            venue = Venue.new
            venue.name = hash["_embedded"]["venues"][0]["name"]
            venue.location = hash["_embedded"]["venues"][0]["city"]["name"]
            venue.address = hash["_embedded"]["venues"][0]["address"]["line1"]
            venue.save
        venue
    end
end
