# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131122210123) do

  create_table "assigned_students", force: true do |t|
    t.integer "student_id"
    t.integer "subject_id"
  end

  add_index "assigned_students", ["student_id"], name: "index_assigned_students_on_student_id"
  add_index "assigned_students", ["subject_id"], name: "index_assigned_students_on_subject_id"

  create_table "assigned_teachers", force: true do |t|
    t.integer "teacher_id"
    t.integer "subject_id"
  end

  add_index "assigned_teachers", ["subject_id"], name: "index_assigned_teachers_on_subject_id"
  add_index "assigned_teachers", ["teacher_id"], name: "index_assigned_teachers_on_teacher_id"

  create_table "courses", force: true do |t|
    t.string  "name"
    t.integer "academic_year"
    t.integer "institution_id"
  end

  create_table "groups", force: true do |t|
    t.string  "identifier"
    t.integer "project_id"
  end

  add_index "groups", ["project_id"], name: "index_groups_on_project_id"

  create_table "institutions", force: true do |t|
    t.string "name"
  end

  create_table "members", force: true do |t|
    t.integer "student_id"
    t.integer "group_id"
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id"
  add_index "members", ["student_id"], name: "index_members_on_student_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.integer  "subject_id"
  end

  add_index "projects", ["subject_id"], name: "index_projects_on_subject_id"

  create_table "students", force: true do |t|
    t.integer "user_id"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "subjects", force: true do |t|
    t.string  "name"
    t.integer "course_id"
    t.integer "responsible_id"
  end

  add_index "subjects", ["course_id"], name: "index_subjects_on_course_id"
  add_index "subjects", ["responsible_id"], name: "index_subjects_on_responsible_id"

  create_table "teachers", force: true do |t|
    t.integer "user_id"
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id"

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
    t.text   "about"
    t.string "phone"
  end

end
