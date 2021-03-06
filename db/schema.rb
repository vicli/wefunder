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

ActiveRecord::Schema.define(version: 20180323003204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contestants", force: :cascade do |t|
    t.integer "tournament_id", null: false
    t.boolean "active", default: true
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "round_id"
    t.boolean "active", default: true
    t.integer "contestant_one_id", null: false
    t.integer "contestant_two_id"
    t.integer "contestant_one_score"
    t.integer "contestant_two_score"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tournament_id", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "tournament_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round_number", null: false
  end

  create_table "tournament_contestant_stats", force: :cascade do |t|
    t.integer "contestant_id", null: false
    t.integer "tournament_id", null: false
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.integer "delta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tournament_type"
  end

end
