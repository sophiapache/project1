class AddSpotifyToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :spotify, :string
  end
end
