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

ActiveRecord::Schema.define(version: 2022_09_01_155432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "backstory"
    t.integer "health"
    t.integer "power"
    t.integer "defence"
    t.bigint "combatant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combatant_id"], name: "index_characters_on_combatant_id"
  end

  create_table "chests", force: :cascade do |t|
    t.bigint "gear_id", null: false
    t.bigint "character_id", null: false
    t.string "rarity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_chests_on_character_id"
    t.index ["gear_id"], name: "index_chests_on_gear_id"
  end

  create_table "combatants", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "current_rounds", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "game_id", null: false
    t.bigint "encounter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_current_rounds_on_character_id"
    t.index ["encounter_id"], name: "index_current_rounds_on_encounter_id"
    t.index ["game_id"], name: "index_current_rounds_on_game_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.string "name"
    t.string "setting"
    t.string "plot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enemies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "health"
    t.integer "power"
    t.integer "defence"
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_enemies_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "round"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gears", force: :cascade do |t|
    t.integer "power"
    t.string "name"
    t.string "description"
    t.string "effect"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "combatants"
  add_foreign_key "chests", "characters"
  add_foreign_key "chests", "gears"
  add_foreign_key "current_rounds", "characters"
  add_foreign_key "current_rounds", "encounters"
  add_foreign_key "current_rounds", "games"
  add_foreign_key "enemies", "games"
end
