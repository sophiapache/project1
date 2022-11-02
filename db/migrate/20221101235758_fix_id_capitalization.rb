class FixIdCapitalization < ActiveRecord::Migration[5.2]
  def change
    rename_column :attendances, :user_ID, :user_id
    rename_column :attendances, :event_ID, :event_id
  end
end
