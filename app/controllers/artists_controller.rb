class ArtistsController < ApplicationController
    def show
        @artist_info = HTTParty.get "https://app.ticketmaster.com/discovery/v2/events?apikey=rDwbiCu00wsFFtXlNb7oOckZAW0qWUDY&locale=*&dmaId=701&genreId=KnvZfZ7vAvF" 
        artistlink = @artist_info["_embedded"]["events"][params[:index].to_i]["_embedded"]["attractions"][0]["externalLinks"]["spotify"][0]["url"]
        @artist_id = artistlink[32,50]
        @artist = RSpotify::Artist.find(@artist_id)
        # split string? 32 33
        # @artist1 = artist.first
        @album1 = @artist.albums.first
        @album2 = @artist.albums.second
        @album3 = @artist.albums.third
        @agenre1 = @artist.genres[0]
        @agenre2 = @artist.genres[1]
        @agenre3 = @artist.genres[2]
        @atrack1 = @artist.top_tracks(:US)[0].name
        @atrack2 = @artist.top_tracks(:US)[1].name
        @atrack3 = @artist.top_tracks(:US)[2].name
        @agenres = @artist.genres
    end
end