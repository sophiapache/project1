# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_03_023702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.text "name"
    t.text "image"
    t.text "genres"
    t.text "tracks"
    t.text "albums"
    t.text "albumimg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spotify"
  end

  create_table "artists_events", force: :cascade do |t|
    t.integer "event_id"
    t.integer "artist_id"
  end

  create_table "artists_songs_to_artists_events", force: :cascade do |t|
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "venue_id"
    t.text "name"
    t.text "image"
    t.date "date"
    t.text "city"
    t.text "state"
    t.string "ticket_id"
    t.text "spotify"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.string "password_digest"
    t.string "name"
    t.text "dob"
    t.text "profpic"
    t.text "favartists"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  create_table "venues", force: :cascade do |t|
    t.text "name"
    t.text "location"
    t.text "address"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
