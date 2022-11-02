class Artist < ApplicationRecord
    has_and_belongs_to_many :events
    def self.import_artist (hash)
        spotify_url = hash["externalLinks"]["spotify"]
        spotify = spotify_url[0]["url"][32,22] unless spotify_url.nil?
        artist = Artist.find_by :spotify => spotify
        if artist.nil?
            info = RSpotify::Artist.find(spotify)
            artist = Artist.new
            artist.spotify = spotify
            artist.name = info.name
            artist.image = info.images.first["url"]
            artist.genres = info.genres.join ", "
            artist.tracks = info.top_tracks(:US).map(&:name).join ", "
            artist.albums = info.albums.map(&:name).join ", "
            artist.albumimg = info.albums.first.images.first["url"]
            artist.save
        end
        artist
    end
end
