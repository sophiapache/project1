class CreateArtistsSongsToArtistsEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_songs_to_artists_events do |t|
    rename_table :artists_songs, :artists_events
    end
  end
end
