class ArtistsController < ApplicationController
    def show
        @artist = Artist.find params[:id]
        # split string? 32 33
        # @artist1 = artist.first
        # @album1 = @artist.albums.first
        # @album2 = @artist.albums.second
        # @album3 = @artist.albums.third
        # @agenre1 = @artist.genres[0]
        # @agenre2 = @artist.genres[1]
        # @agenre3 = @artist.genres[2]
        # @atrack1 = @artist.top_tracks(:US)[0].name
        # @atrack2 = @artist.top_tracks(:US)[1].name
        # @atrack3 = @artist.top_tracks(:US)[2].name
        # @agenres = @artist.genres
    end
end