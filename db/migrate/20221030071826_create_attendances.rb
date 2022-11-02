class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :user_ID
      t.integer :event_ID

      t.timestamps
    end
  end
end
