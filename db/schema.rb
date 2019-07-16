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

ActiveRecord::Schema.define(version: 2019_07_16_015934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_for_jobs", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_application_for_jobs_on_job_id"
    t.index ["person_id"], name: "index_application_for_jobs_on_person_id"
  end

  create_table "distances", force: :cascade do |t|
    t.bigint "src_id"
    t.bigint "dst_id"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dst_id"], name: "index_distances_on_dst_id"
    t.index ["src_id"], name: "index_distances_on_src_id"
  end

  create_table "edges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "company"
    t.string "title"
    t.string "description"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "edge_id"
    t.index ["edge_id"], name: "index_jobs_on_edge_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "occupation"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "edge_id"
    t.index ["edge_id"], name: "index_people_on_edge_id"
  end

  add_foreign_key "application_for_jobs", "jobs"
  add_foreign_key "application_for_jobs", "people"
  add_foreign_key "distances", "edges", column: "dst_id"
  add_foreign_key "distances", "edges", column: "src_id"
  add_foreign_key "jobs", "edges"
  add_foreign_key "people", "edges"
end
