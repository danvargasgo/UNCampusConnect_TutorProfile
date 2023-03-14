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

ActiveRecord::Schema[7.0].define(version: 2023_03_13_121300) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_tutors", id: false, force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.bigint "skill_id", null: false
    t.index ["skill_id", "tutor_id"], name: "index_skills_tutors_on_skill_id_and_tutor_id"
    t.index ["tutor_id", "skill_id"], name: "index_skills_tutors_on_tutor_id_and_skill_id"
  end

  create_table "tutor_jobs", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.bigint "job_id", null: false
    t.string "position"
    t.date "start_year"
    t.date "end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_tutor_jobs_on_job_id"
    t.index ["tutor_id"], name: "index_tutor_jobs_on_tutor_id"
  end

  create_table "tutor_languages", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.bigint "language_id", null: false
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_tutor_languages_on_language_id"
    t.index ["tutor_id"], name: "index_tutor_languages_on_tutor_id"
  end

  create_table "tutor_schools", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.bigint "school_id", null: false
    t.string "title"
    t.date "start_year"
    t.date "end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_tutor_schools_on_school_id"
    t.index ["tutor_id"], name: "index_tutor_schools_on_tutor_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "birth_place"
    t.date "birthdate"
    t.string "address"
    t.string "email"
    t.string "phone"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tutor_jobs", "jobs"
  add_foreign_key "tutor_jobs", "tutors"
  add_foreign_key "tutor_languages", "languages"
  add_foreign_key "tutor_languages", "tutors"
  add_foreign_key "tutor_schools", "schools"
  add_foreign_key "tutor_schools", "tutors"
end
