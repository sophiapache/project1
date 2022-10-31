class ArtistsController < ApplicationController
    def show
        artist_info = HTTParty.get "https://app.ticketmaster.com/discovery/v2/events?apikey=rDwbiCu00wsFFtXlNb7oOckZAW0qWUDY&locale=*&dmaId=701&genreId=KnvZfZ7vAvF" 
        artistlink = artist_info["_embedded"]["events"][params[:index].to_i]["_embedded"]["attractions"][0]["externalLinks"]["spotify"][0]["url"]
        @artist_id = artistlink[32,50]
        artist = RSpotify::Artist.find(@artist_id)
        # split string? 32 33
        @artist1 = artist.first
        @albums = @artist1.albums
        @aimage= @artist1.images[0]
        @albumimgs = @artist1.albums.images[0]
        @atracks = @artist1.top_tracks(:US)
        @agenres = @artist1.genres
    end
end