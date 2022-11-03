class ArtistsController < ApplicationController
    # find artst id using show method
    def show
        @artist = Artist.find params[:id]
    end
end