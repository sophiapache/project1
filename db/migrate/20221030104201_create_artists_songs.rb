class CreateArtistsSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_songs do |t|
      t.integer :event_id
      t.integer :artist_id
    end
  end
end
