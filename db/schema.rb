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

ActiveRecord::Schema[8.0].define(version: 2026_05_16_173655) do
  create_table "academic_details", force: :cascade do |t|
    t.integer "student_id", null: false
    t.float "i_sem"
    t.float "ii_sem"
    t.float "iii_sem"
    t.float "iv_sem"
    t.float "v_sem"
    t.float "vi_sem"
    t.float "vii_sem"
    t.float "viii_sem"
    t.float "cgpa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_academic_details_on_student_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "department_semesters", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "semester_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_department_semesters_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "external_marks", force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "external_exam"
    t.float "final_total"
    t.string "grade"
    t.float "gpa"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_external_marks_on_subject_id"
  end

  create_table "internal_marks", force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "i1_assignment"
    t.integer "i1_assessment"
    t.integer "i1_ethics"
    t.integer "i1_classwork"
    t.float "i1_total"
    t.integer "i2_assignment"
    t.integer "i2_assessment"
    t.integer "i2_ethics"
    t.integer "i2_classwork"
    t.float "i2_total"
    t.float "best_internal"
    t.float "least_internal"
    t.float "final_internal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_internal_marks_on_subject_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "semester_no"
    t.string "academic_year"
    t.float "sgpa"
    t.float "cgpa"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_semesters_on_student_id"
  end

  create_table "student_marks", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.integer "i1_assignment"
    t.integer "i1_assessment"
    t.integer "i1_ethics"
    t.integer "i1_classwork"
    t.float "i1_total"
    t.integer "i2_assignment"
    t.integer "i2_assessment"
    t.integer "i2_ethics"
    t.integer "i2_classwork"
    t.float "i2_total"
    t.float "best_internal"
    t.float "least_internal"
    t.float "final_internal"
    t.integer "external_exam"
    t.float "final_total"
    t.string "grade"
    t.float "gpa"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_marks_on_student_id"
    t.index ["subject_id"], name: "index_student_marks_on_subject_id"
  end

  create_table "student_semesters", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "semester_no"
    t.float "sgpa"
    t.float "cgpa"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_semesters_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "roll_no"
    t.string "name"
    t.string "father_name"
    t.string "mother_name"
    t.date "dob"
    t.integer "semester"
    t.string "section"
    t.string "course"
    t.string "scheme"
    t.text "address"
    t.integer "user_id", null: false
    t.integer "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_students_on_department_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_code"
    t.string "subject_name"
    t.integer "credits"
    t.string "subject_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_semester_id"
    t.index ["department_semester_id"], name: "index_subjects_on_department_semester_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "id_number"
    t.string "name"
    t.date "doj"
    t.string "qualifications"
    t.string "specialization"
    t.integer "user_id", null: false
    t.integer "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_teachers_on_department_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.integer "department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "academic_details", "students"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "department_semesters", "departments"
  add_foreign_key "external_marks", "subjects"
  add_foreign_key "internal_marks", "subjects"
  add_foreign_key "semesters", "students"
  add_foreign_key "student_marks", "students"
  add_foreign_key "student_marks", "subjects"
  add_foreign_key "student_semesters", "students"
  add_foreign_key "students", "departments"
  add_foreign_key "students", "users"
  add_foreign_key "subjects", "department_semesters"
  add_foreign_key "teachers", "departments"
  add_foreign_key "teachers", "users"
end
