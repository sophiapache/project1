class AddNameToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :text
    add_column :events, :image, :text
    add_column :events, :date, :date
    add_column :events, :city, :text
    add_column :events, :state, :text
    add_column :events, :ticket_id, :string
    add_column :events, :spotify, :text
  end
end
