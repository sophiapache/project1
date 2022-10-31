class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.string :password_digest
      t.string :name
      t.text :dob
      t.text :profpic
      t.text :favartists
      t.text :description

      t.timestamps
    end
  end
end
