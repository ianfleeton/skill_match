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

ActiveRecord::Schema[7.0].define(version: 2022_11_02_164345) do
  create_table "interests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "skill_id", null: false
    t.integer "level_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_interests_on_level_id"
    t.index ["skill_id"], name: "index_interests_on_skill_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "tutor_id", null: false
    t.integer "learner_id", null: false
    t.integer "skill_id", null: false
    t.integer "level_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learner_id"], name: "index_matches_on_learner_id"
    t.index ["level_id"], name: "index_matches_on_level_id"
    t.index ["skill_id"], name: "index_matches_on_skill_id"
    t.index ["tutor_id"], name: "index_matches_on_tutor_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_skills_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name", null: false
    t.string "location"
    t.boolean "tutor", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interests", "levels"
  add_foreign_key "interests", "skills"
  add_foreign_key "interests", "users"
  add_foreign_key "matches", "levels"
  add_foreign_key "matches", "skills"
  add_foreign_key "matches", "users", column: "learner_id"
  add_foreign_key "matches", "users", column: "tutor_id"
end
