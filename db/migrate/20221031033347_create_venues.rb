class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.text :name
      t.text :location
      t.text :address
      t.text :image

      t.timestamps
    end
  end
end
