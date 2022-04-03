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

ActiveRecord::Schema[7.0].define(version: 2022_04_03_145904) do
  create_table "advisor_feedbacks", force: :cascade do |t|
    t.integer "grade"
    t.text "comment"
    t.integer "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_advisor_feedbacks_on_match_id"
  end

  create_table "advisors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_advisors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_advisors_on_reset_password_token", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.integer "advisor_id", null: false
    t.integer "user_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_matches_on_advisor_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "social_name"
    t.date "birthday"
    t.integer "gender"
    t.string "adress"
    t.string "adress_number"
    t.string "adress_complement"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "born_in"
    t.string "cpf"
    t.string "rg"
    t.string "rg_issuer"
    t.boolean "deficient"
    t.integer "deficient_description"
    t.string "mom_name"
    t.integer "marital_status"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "advisor_feedbacks", "matches"
  add_foreign_key "matches", "advisors"
  add_foreign_key "matches", "users"
  add_foreign_key "user_profiles", "users"
end
