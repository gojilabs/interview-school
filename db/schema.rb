# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_24_201609) do

  create_table "classroom_sections", force: :cascade do |t|
    t.integer "classroom_id", null: false
    t.integer "section_id", null: false
    t.index ["classroom_id", "section_id"], name: "index_classroom_sections_on_classroom_id_and_section_id", unique: true
    t.index ["classroom_id"], name: "index_classroom_sections_on_classroom_id"
    t.index ["section_id"], name: "index_classroom_sections_on_section_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.integer "numeral"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.datetime "time_start"
    t.integer "time_length"
    t.integer "week_days"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "subject_id", null: false
    t.index ["subject_id"], name: "index_sections_on_subject_id"
  end

  create_table "student_sections", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "section_id", null: false
    t.index ["section_id"], name: "index_student_sections_on_section_id"
    t.index ["student_id", "section_id"], name: "index_student_sections_on_student_id_and_section_id", unique: true
    t.index ["student_id"], name: "index_student_sections_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teacher_sections", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "section_id", null: false
    t.index ["section_id"], name: "index_teacher_sections_on_section_id"
    t.index ["teacher_id", "section_id"], name: "index_teacher_sections_on_teacher_id_and_section_id", unique: true
    t.index ["teacher_id"], name: "index_teacher_sections_on_teacher_id"
  end

  create_table "teacher_subjects", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "subject_id", null: false
    t.integer "level", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_teacher_subjects_on_subject_id"
    t.index ["teacher_id", "subject_id"], name: "index_teacher_subjects_on_teacher_id_and_subject_id", unique: true
    t.index ["teacher_id"], name: "index_teacher_subjects_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "classroom_sections", "classrooms"
  add_foreign_key "classroom_sections", "sections"
  add_foreign_key "sections", "subjects"
  add_foreign_key "student_sections", "sections"
  add_foreign_key "student_sections", "students"
  add_foreign_key "teacher_sections", "sections"
  add_foreign_key "teacher_sections", "teachers"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "teacher_subjects", "teachers"
end
