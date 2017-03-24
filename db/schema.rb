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

ActiveRecord::Schema.define(version: 20171024175352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistances", force: :cascade do |t|
    t.date     "date",        null: false
    t.text     "description", null: false
    t.string   "title",       null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_assistances_on_user_id", using: :btree
  end

  create_table "buildings", force: :cascade do |t|
    t.text     "address",          null: false
    t.string   "name",             null: false
    t.integer  "neighbourhood_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["neighbourhood_id"], name: "index_buildings_on_neighbourhood_id", using: :btree
  end

  create_table "comments_assistances", force: :cascade do |t|
    t.text     "content",       null: false
    t.integer  "assistance_id", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assistance_id"], name: "index_comments_assistances_on_assistance_id", using: :btree
    t.index ["user_id"], name: "index_comments_assistances_on_user_id", using: :btree
  end

  create_table "comments_events", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "event_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_events_on_event_id", using: :btree
    t.index ["user_id"], name: "index_comments_events_on_user_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "location",   null: false
    t.string   "name",       null: false
    t.integer  "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_documents_on_meeting_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.date     "date",        null: false
    t.text     "description", null: false
    t.string   "location",    null: false
    t.string   "title",       null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "events_users", force: :cascade do |t|
    t.integer  "attend",     null: false
    t.integer  "event_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_events_users_on_event_id", using: :btree
    t.index ["user_id"], name: "index_events_users_on_user_id", using: :btree
  end

  create_table "meetings", force: :cascade do |t|
    t.date     "date",             null: false
    t.string   "location",         null: false
    t.string   "title",            null: false
    t.integer  "neighbourhood_id", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["neighbourhood_id"], name: "index_meetings_on_neighbourhood_id", using: :btree
    t.index ["user_id"], name: "index_meetings_on_user_id", using: :btree
  end

  create_table "neighbourhoods", force: :cascade do |t|
    t.string   "strata_title", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "notices", force: :cascade do |t|
    t.date     "date",             null: false
    t.text     "description",      null: false
    t.string   "title",            null: false
    t.integer  "neighbourhood_id", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["neighbourhood_id"], name: "index_notices_on_neighbourhood_id", using: :btree
    t.index ["user_id"], name: "index_notices_on_user_id", using: :btree
  end

  create_table "polls", force: :cascade do |t|
    t.text     "description",      null: false
    t.string   "title",            null: false
    t.integer  "neighbourhood_id", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["neighbourhood_id"], name: "index_polls_on_neighbourhood_id", using: :btree
    t.index ["user_id"], name: "index_polls_on_user_id", using: :btree
  end

  create_table "polls_users", force: :cascade do |t|
    t.integer  "vote",       null: false
    t.integer  "poll_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_polls_users_on_poll_id", using: :btree
    t.index ["user_id"], name: "index_polls_users_on_user_id", using: :btree
  end

  create_table "units", force: :cascade do |t|
    t.string   "resident_code", null: false
    t.string   "unit_number",   null: false
    t.integer  "building_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["building_id"], name: "index_units_on_building_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "entered_code",    null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.boolean  "on_council",      null: false
    t.string   "password_digest", null: false
    t.integer  "unit_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["unit_id"], name: "index_users_on_unit_id", using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "location",   null: false
    t.string   "name",       null: false
    t.integer  "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_videos_on_meeting_id", using: :btree
  end

  add_foreign_key "assistances", "users"
  add_foreign_key "buildings", "neighbourhoods"
  add_foreign_key "comments_assistances", "assistances"
  add_foreign_key "comments_assistances", "users"
  add_foreign_key "comments_events", "events"
  add_foreign_key "comments_events", "users"
  add_foreign_key "documents", "meetings"
  add_foreign_key "events", "users"
  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "users"
  add_foreign_key "meetings", "neighbourhoods"
  add_foreign_key "meetings", "users"
  add_foreign_key "notices", "neighbourhoods"
  add_foreign_key "notices", "users"
  add_foreign_key "polls", "neighbourhoods"
  add_foreign_key "polls", "users"
  add_foreign_key "polls_users", "polls"
  add_foreign_key "polls_users", "users"
  add_foreign_key "units", "buildings"
  add_foreign_key "users", "units"
  add_foreign_key "videos", "meetings"
end
