# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_14_025453) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coach_participants", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_coach_participants_on_coach_id"
    t.index ["participant_id"], name: "index_coach_participants_on_participant_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.bigint "host_id"
    t.bigint "sport_id"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_events_on_host_id"
    t.index ["sport_id"], name: "index_events_on_sport_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.bigint "organizer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizer_id"], name: "index_organizations_on_organizer_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "participant_id"
    t.string "unit"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_results_on_event_id"
    t.index ["participant_id"], name: "index_results_on_participant_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "win_condition"
    t.boolean "has_attempts"
    t.integer "max_attempts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_users_events_on_event_id"
    t.index ["user_id"], name: "index_users_events_on_user_id"
  end

  add_foreign_key "coach_participants", "users", column: "coach_id"
  add_foreign_key "coach_participants", "users", column: "participant_id"
  add_foreign_key "events", "organizations", column: "host_id"
  add_foreign_key "events", "sports"
  add_foreign_key "organizations", "users", column: "organizer_id"
  add_foreign_key "results", "events"
  add_foreign_key "results", "users", column: "participant_id"
  add_foreign_key "users_events", "events"
  add_foreign_key "users_events", "users"
end
