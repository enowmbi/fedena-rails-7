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

ActiveRecord::Schema[7.0].define(version: 20_220_516_225_036) do
  create_table "academic_details", force: :cascade do |t|
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_exam_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "batch_id"
    t.string  "exam_type"
    t.boolean "is_published",     default: false
    t.boolean "result_published", default: false
    t.string  "students_list"
    t.date    "exam_date"
    t.integer "school_id"
  end

  add_index "additional_exam_groups", ["school_id"], name: "index_additional_exam_groups_on_school_id"

  create_table "additional_exam_scores", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "additional_exam_id"
    t.decimal  "marks", precision: 7, scale: 2
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "additional_exam_scores", ["school_id"], name: "index_additional_exam_scores_on_school_id"

  create_table "additional_exams", force: :cascade do |t|
    t.integer  "additional_exam_group_id"
    t.integer  "subject_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "maximum_marks"
    t.integer  "minimum_marks"
    t.integer  "grading_level_id"
    t.integer  "weightage", default: 0
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "additional_exams", ["school_id"], name: "index_additional_exams_on_school_id"

  create_table "additional_fields", force: :cascade do |t|
    t.string  "name"
    t.boolean "status"
    t.integer "school_id"
  end

  add_index "additional_fields", ["school_id"], name: "index_additional_fields_on_school_id"

  create_table "applicant_addl_attachments", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "applicant_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_addl_attachments", ["applicant_id"], name: "index_applicant_addl_attachments_on_applicant_id"
  add_index "applicant_addl_attachments", ["school_id"], name: "index_applicant_addl_attachments_on_school_id"

  create_table "applicant_addl_field_groups", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "registration_course_id"
    t.string   "name"
    t.boolean  "is_active", default: true
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_addl_field_groups", ["is_active"], name: "index_applicant_addl_field_groups_on_is_active"
  add_index "applicant_addl_field_groups", ["registration_course_id"],
            name: "index_applicant_addl_field_groups_on_registration_course_id"
  add_index "applicant_addl_field_groups", ["school_id"], name: "index_applicant_addl_field_groups_on_school_id"

  create_table "applicant_addl_field_values", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "applicant_addl_field_id"
    t.string   "option"
    t.boolean  "is_active", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_addl_field_values", ["applicant_addl_field_id"],
            name: "index_applicant_addl_field_values_on_applicant_addl_field_id"
  add_index "applicant_addl_field_values", ["school_id"], name: "index_applicant_addl_field_values_on_school_id"

  create_table "applicant_addl_fields", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "applicant_addl_field_group_id"
    t.string   "field_name"
    t.string   "field_type"
    t.boolean  "is_active", default: true
    t.integer  "position"
    t.boolean  "is_mandatory", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_addl_fields", ["applicant_addl_field_group_id"],
            name: "index_applicant_addl_fields_on_applicant_addl_field_group_id"
  add_index "applicant_addl_fields", ["school_id"], name: "index_applicant_addl_fields_on_school_id"

  create_table "applicant_addl_values", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "applicant_id"
    t.integer  "applicant_addl_field_id"
    t.text     "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_addl_values", ["applicant_addl_field_id"],
            name: "index_applicant_addl_values_on_applicant_addl_field_id"
  add_index "applicant_addl_values", ["applicant_id"], name: "index_applicant_addl_values_on_applicant_id"
  add_index "applicant_addl_values", ["school_id"], name: "index_applicant_addl_values_on_school_id"

  create_table "applicant_guardians", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "applicant_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.string   "email"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.date     "dob"
    t.string   "occupation"
    t.string   "income"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_guardians", ["applicant_id"], name: "index_applicant_guardians_on_applicant_id"
  add_index "applicant_guardians", ["school_id"], name: "index_applicant_guardians_on_school_id"

  create_table "applicant_previous_datas", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "applicant_id"
    t.string   "last_attended_school"
    t.string   "qualifying_exam"
    t.string   "qualifying_exam_year"
    t.string   "qualifying_exam_roll"
    t.string   "qualifying_exam_final_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_previous_datas", ["applicant_id"], name: "index_applicant_previous_datas_on_applicant_id"
  add_index "applicant_previous_datas", ["school_id"], name: "index_applicant_previous_datas_on_school_id"

  create_table "applicant_registration_settings", force: :cascade do |t|
    t.integer  "school_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_registration_settings", ["school_id"],
            name: "index_applicant_registration_settings_on_school_id"

  create_table "applicants", force: :cascade do |t|
    t.integer  "school_id"
    t.string   "reg_no"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "country_id"
    t.integer  "nationality_id", null: false
    t.string   "pin_code"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "gender"
    t.integer  "registration_course_id"
    t.integer  "applicant_guardians_id"
    t.integer  "applicant_previous_data_id"
    t.integer  "photo_file_size"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "status"
    t.boolean  "has_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicants", ["created_at"], name: "index_applicants_on_created_at"
  add_index "applicants", ["school_id"], name: "index_applicants_on_school_id"
  add_index "applicants", ["status"], name: "index_applicants_on_status"

  create_table "apply_leaves", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "employee_leave_types_id"
    t.boolean "is_half_day"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "reason"
    t.boolean "approved",                default: false
    t.boolean "viewed_by_manager",       default: false
    t.string  "manager_remark"
    t.integer "school_id"
  end

  add_index "apply_leaves", ["school_id"], name: "index_apply_leaves_on_school_id"

  create_table "archived_employee_additional_details", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "additional_field_id"
    t.string  "additional_info"
    t.integer "school_id"
  end

  add_index "archived_employee_additional_details", ["school_id"],
            name: "index_archived_employee_additional_details_on_school_id"

  create_table "archived_employee_bank_details", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "bank_field_id"
    t.string  "bank_info"
    t.integer "school_id"
  end

  add_index "archived_employee_bank_details", ["school_id"],
            name: "index_archived_employee_bank_details_on_school_id"

  create_table "archived_employee_salary_structures", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "payroll_category_id"
    t.string  "amount"
    t.integer "school_id"
  end

  add_index "archived_employee_salary_structures", ["school_id"],
            name: "index_archived_employee_salary_structures_on_school_id"

  create_table "archived_employees", force: :cascade do |t|
    t.integer  "employee_category_id"
    t.string   "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.boolean  "gender"
    t.string   "job_title"
    t.integer  "employee_position_id"
    t.integer  "employee_department_id"
    t.integer  "reporting_manager_id"
    t.integer  "employee_grade_id"
    t.string   "qualification"
    t.text     "experience_detail"
    t.integer  "experience_year"
    t.integer  "experience_month"
    t.boolean  "status"
    t.string   "status_description"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "children_count"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "husband_name"
    t.string   "blood_group"
    t.integer  "nationality_id"
    t.string   "home_address_line1"
    t.string   "home_address_line2"
    t.string   "home_city"
    t.string   "home_state"
    t.integer  "home_country_id"
    t.string   "home_pin_code"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "office_city"
    t.string   "office_state"
    t.integer  "office_country_id"
    t.string   "office_pin_code"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "fax"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.binary   "photo_data", limit: 16_777_215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "library_card"
    t.integer  "photo_file_size"
    t.string   "former_id"
    t.integer  "school_id"
  end

  add_index "archived_employees", ["school_id"], name: "index_archived_employees_on_school_id"

  create_table "archived_exam_scores", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "exam_id"
    t.decimal  "marks", precision: 7, scale: 2
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "archived_exam_scores", ["school_id"], name: "index_archived_exam_scores_on_school_id"
  add_index "archived_exam_scores", %w[student_id exam_id],
            name: "index_archived_exam_scores_on_student_id_and_exam_id"

  create_table "archived_guardians", force: :cascade do |t|
    t.integer  "ward_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.string   "email"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.date     "dob"
    t.string   "occupation"
    t.string   "income"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "archived_guardians", ["school_id"], name: "index_archived_guardians_on_school_id"

  create_table "archived_students", force: :cascade do |t|
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "birth_place"
    t.integer  "nationality_id"
    t.string   "language"
    t.string   "religion"
    t.integer  "student_category_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "pin_code"
    t.integer  "country_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.binary   "photo_data", limit: 16_777_215
    t.string   "status_description"
    t.boolean  "is_active",                                default: true
    t.boolean  "is_deleted",                               default: false
    t.integer  "immediate_contact_id"
    t.boolean  "is_sms_enabled", default: true
    t.string   "former_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "library_card"
    t.integer  "photo_file_size"
    t.text     "passport_number"
    t.date     "enrollment_date"
    t.integer  "school_id"
  end

  add_index "archived_students", ["school_id"], name: "index_archived_students_on_school_id"

  create_table "asset_entries", force: :cascade do |t|
    t.text     "dynamic_attributes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_asset_id"
    t.integer  "school_id"
  end

  create_table "asset_field_options", force: :cascade do |t|
    t.integer  "asset_field_id"
    t.string   "option"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "asset_fields", force: :cascade do |t|
    t.integer  "school_asset_id"
    t.string   "field_name"
    t.string   "field_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "assets", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "amount"
    t.boolean  "is_inactive", default: false
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "assets", ["school_id"], name: "index_assets_on_school_id"

  create_table "assignment_answers", force: :cascade do |t|
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.string   "status", default: "0"
    t.string   "title"
    t.text     "content"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "subject_id"
    t.string   "student_list"
    t.string   "title"
    t.text     "content"
    t.datetime "duedate"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "attachment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "registration_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "student_id"
    t.integer "period_table_entry_id"
    t.boolean "forenoon",              default: false
    t.boolean "afternoon",             default: false
    t.string  "reason"
    t.integer "school_id"
    t.date    "month_date"
    t.integer "batch_id"
  end

  add_index "attendances", %w[month_date batch_id], name: "index_attendances_on_month_date_and_batch_id"
                                                    
  add_index "attendances", ["school_id"], name: "index_attendances_on_school_id"
  add_index "attendances", %w[student_id batch_id], name: "index_attendances_on_student_id_and_batch_id"

  create_table "bank_fields", force: :cascade do |t|
    t.string  "name"
    t.boolean "status"
    t.integer "school_id"
  end

  add_index "bank_fields", ["school_id"], name: "index_bank_fields_on_school_id"

  create_table "batch_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "batch_events", ["batch_id"], name: "index_batch_events_on_batch_id"
  add_index "batch_events", ["school_id"], name: "index_batch_events_on_school_id"

  create_table "batch_groups", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batch_seats", force: :cascade do |t|
    t.integer  "seat"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batch_students", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "batch_id"
    t.integer "school_id"
  end

  add_index "batch_students", %w[batch_id student_id], name: "index_batch_students_on_batch_id_and_student_id"
  add_index "batch_students", ["school_id"], name: "index_batch_students_on_school_id"

  create_table "batches", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_active",    default: true
    t.boolean  "is_deleted",   default: false
    t.string   "employee_id"
    t.integer  "school_id"
    t.string   "grading_type"
  end

  add_index "batches", %w[is_deleted is_active course_id name],
            name: "index_batches_on_is_deleted_and_is_active_and_course_id_and_name"
  add_index "batches", ["school_id"], name: "index_batches_on_school_id"

  create_table "book_movements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.date     "issue_date"
    t.date     "due_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "book_reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "reserved_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "book_number"
    t.integer  "book_movement_id"
    t.string   "status", default: "available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "class_designations", force: :cascade do |t|
    t.string   "name", null: false
    t.decimal  "cgpa", precision: 15, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "marks", precision: 15, scale: 2
  end

  create_table "class_timings", force: :cascade do |t|
    t.integer "batch_id"
    t.string  "name"
    t.time    "start_time"
    t.time    "end_time"
    t.boolean "is_break"
    t.integer "school_id"
    t.boolean "is_deleted", default: false
  end

  add_index "class_timings", %w[batch_id start_time end_time],
            name: "index_class_timings_on_batch_id_and_start_time_and_end_time"
  add_index "class_timings", ["school_id"], name: "index_class_timings_on_school_id"

  create_table "community_reservations", force: :cascade do |t|
    t.string   "name"
    t.integer  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configurations", force: :cascade do |t|
    t.string  "config_key"
    t.string  "config_value"
    t.integer "school_id"
  end

  add_index "configurations", ["config_key"], name: "index_configurations_on_config_key"
  add_index "configurations", ["config_value"], name: "index_configurations_on_config_value"
  add_index "configurations", ["school_id"], name: "index_configurations_on_school_id"

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "course_streams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "stream_id"
  end

  create_table "course_subjects", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "subject_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.string   "code"
    t.string   "section_name"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["locked_by"], name: "index_delayed_jobs_on_locked_by"

  create_table "elective_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "elective_groups", ["school_id"], name: "index_elective_groups_on_school_id"

  create_table "electives", force: :cascade do |t|
    t.integer  "elective_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "electives", ["school_id"], name: "index_electives_on_school_id"

  create_table "employee_additional_details", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "additional_field_id"
    t.string  "additional_info"
    t.integer "school_id"
  end

  add_index "employee_additional_details", ["school_id"], name: "index_employee_additional_details_on_school_id"

  create_table "employee_attendances", force: :cascade do |t|
    t.date    "attendance_date"
    t.integer "employee_id"
    t.integer "employee_leave_type_id"
    t.string  "reason"
    t.boolean "is_half_day"
    t.integer "school_id"
  end

  add_index "employee_attendances", ["school_id"], name: "index_employee_attendances_on_school_id"

  create_table "employee_bank_details", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "bank_field_id"
    t.string  "bank_info"
    t.integer "school_id"
  end

  add_index "employee_bank_details", ["school_id"], name: "index_employee_bank_details_on_school_id"

  create_table "employee_categories", force: :cascade do |t|
    t.string  "name"
    t.string  "prefix"
    t.boolean "status"
    t.integer "school_id"
  end

  add_index "employee_categories", ["school_id"], name: "index_employee_categories_on_school_id"

  create_table "employee_department_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "employee_department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "employee_department_events", ["school_id"], name: "index_employee_department_events_on_school_id"

  create_table "employee_departments", force: :cascade do |t|
    t.string  "code"
    t.string  "name"
    t.boolean "status"
    t.integer "school_id"
  end

  add_index "employee_departments", ["school_id"], name: "index_employee_departments_on_school_id"

  create_table "employee_grades", force: :cascade do |t|
    t.string  "name"
    t.integer "priority"
    t.boolean "status"
    t.integer "max_hours_day"
    t.integer "max_hours_week"
    t.integer "school_id"
  end

  add_index "employee_grades", ["school_id"], name: "index_employee_grades_on_school_id"

  create_table "employee_leave_types", force: :cascade do |t|
    t.string  "name"
    t.string  "code"
    t.boolean "status"
    t.string  "max_leave_count"
    t.boolean "carry_forward", default: false, null: false
    t.integer "school_id"
  end

  add_index "employee_leave_types", ["school_id"], name: "index_employee_leave_types_on_school_id"

  create_table "employee_leaves", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "employee_leave_type_id"
    t.decimal  "leave_count",            precision: 5, scale: 1, default: 0.0
    t.decimal  "leave_taken",            precision: 5, scale: 1, default: 0.0
    t.date     "reset_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "employee_leaves", ["school_id"], name: "index_employee_leaves_on_school_id"

  create_table "employee_positions", force: :cascade do |t|
    t.string  "name"
    t.integer "employee_category_id"
    t.boolean "status"
    t.integer "school_id"
  end

  add_index "employee_positions", ["school_id"], name: "index_employee_positions_on_school_id"

  create_table "employee_salary_structures", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "payroll_category_id"
    t.string  "amount"
    t.integer "school_id"
  end

  add_index "employee_salary_structures", ["school_id"], name: "index_employee_salary_structures_on_school_id"

  create_table "employees", force: :cascade do |t|
    t.integer  "employee_category_id"
    t.string   "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.boolean  "gender"
    t.string   "job_title"
    t.integer  "employee_position_id"
    t.integer  "employee_department_id"
    t.integer  "reporting_manager_id"
    t.integer  "employee_grade_id"
    t.string   "qualification"
    t.text     "experience_detail"
    t.integer  "experience_year"
    t.integer  "experience_month"
    t.boolean  "status"
    t.string   "status_description"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "children_count"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "husband_name"
    t.string   "blood_group"
    t.integer  "nationality_id"
    t.string   "home_address_line1"
    t.string   "home_address_line2"
    t.string   "home_city"
    t.string   "home_state"
    t.integer  "home_country_id"
    t.string   "home_pin_code"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "office_city"
    t.string   "office_state"
    t.integer  "office_country_id"
    t.string   "office_pin_code"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "fax"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.binary   "photo_data", limit: 16_777_215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "library_card"
    t.integer  "photo_file_size"
    t.integer  "user_id"
    t.integer  "school_id"
  end

  add_index "employees", ["employee_number"], name: "index_employees_on_employee_number"
  add_index "employees", ["school_id"], name: "index_employees_on_school_id"

  create_table "employees_subjects", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "subject_id"
    t.integer "school_id"
  end

  add_index "employees_subjects", ["school_id"], name: "index_employees_subjects_on_school_id"
  add_index "employees_subjects", ["subject_id"], name: "index_employees_subjects_on_subject_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_common",   default: false
    t.boolean  "is_holiday",  default: false
    t.boolean  "is_exam",     default: false
    t.boolean  "is_due",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "origin_id"
    t.string   "origin_type"
    t.integer  "school_id"
  end

  add_index "events", %w[is_common is_holiday is_exam], name: "index_events_on_is_common_and_is_holiday_and_is_exam"
  add_index "events", ["school_id"], name: "index_events_on_school_id"

  create_table "exam_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "batch_id"
    t.string  "exam_type"
    t.boolean "is_published",     default: false
    t.boolean "result_published", default: false
    t.date    "exam_date"
    t.integer "school_id"
    t.boolean "is_final_exam", default: false, null: false
  end

  add_index "exam_groups", ["school_id"], name: "index_exam_groups_on_school_id"

  create_table "exam_scores", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "exam_id"
    t.decimal  "marks", precision: 7, scale: 2
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "exam_scores", ["school_id"], name: "index_exam_scores_on_school_id"
  add_index "exam_scores", %w[student_id exam_id], name: "index_exam_scores_on_student_id_and_exam_id"

  create_table "exams", force: :cascade do |t|
    t.integer  "exam_group_id"
    t.integer  "subject_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "maximum_marks",    precision: 10, scale: 2
    t.decimal  "minimum_marks",    precision: 10, scale: 2
    t.integer  "grading_level_id"
    t.integer  "weightage", default: 0
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "exams", %w[exam_group_id subject_id], name: "index_exams_on_exam_group_id_and_subject_id"
  add_index "exams", ["school_id"], name: "index_exams_on_school_id"

  create_table "fee_collection_discounts", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "receiver_id"
    t.integer  "finance_fee_collection_id"
    t.decimal  "discount", precision: 15, scale: 2
    t.boolean  "is_amount", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "fee_collection_discounts", ["school_id"], name: "index_fee_collection_discounts_on_school_id"

  create_table "fee_collection_particulars", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount", precision: 12, scale: 2
    t.integer  "finance_fee_collection_id"
    t.integer  "student_category_id"
    t.string   "admission_no"
    t.integer  "student_id"
    t.boolean  "is_deleted", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "fee_collection_particulars", ["school_id"], name: "index_fee_collection_particulars_on_school_id"

  create_table "fee_discounts", force: :cascade do |t|
    t.string  "type"
    t.string  "name"
    t.integer "receiver_id"
    t.integer "finance_fee_category_id"
    t.decimal "discount", precision: 15, scale: 2
    t.boolean "is_amount", default: false
    t.integer "school_id"
  end

  add_index "fee_discounts", ["school_id"], name: "index_fee_discounts_on_school_id"

  create_table "finance_donations", force: :cascade do |t|
    t.string   "donor"
    t.string   "description"
    t.decimal  "amount", precision: 15, scale: 2
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "transaction_date"
    t.integer  "school_id"
  end

  add_index "finance_donations", ["school_id"], name: "index_finance_donations_on_school_id"

  create_table "finance_fee_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "batch_id"
    t.boolean  "is_deleted",  default: false, null: false
    t.boolean  "is_master",   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "finance_fee_categories", ["school_id"], name: "index_finance_fee_categories_on_school_id"

  create_table "finance_fee_collections", force: :cascade do |t|
    t.string  "name"
    t.date    "start_date"
    t.date    "end_date"
    t.date    "due_date"
    t.integer "fee_category_id"
    t.integer "batch_id"
    t.boolean "is_deleted", default: false, null: false
    t.integer "school_id"
  end

  add_index "finance_fee_collections", ["fee_category_id"], name: "index_finance_fee_collections_on_fee_category_id"
  add_index "finance_fee_collections", ["school_id"], name: "index_finance_fee_collections_on_school_id"

  create_table "finance_fee_particulars", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount", precision: 15, scale: 2
    t.integer  "finance_fee_category_id"
    t.integer  "student_category_id"
    t.string   "admission_no"
    t.integer  "student_id"
    t.boolean  "is_deleted", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "finance_fee_particulars", ["school_id"], name: "index_finance_fee_particulars_on_school_id"

  create_table "finance_fee_structure_elements", force: :cascade do |t|
    t.decimal "amount", precision: 15, scale: 2
    t.string  "label"
    t.integer "batch_id"
    t.integer "student_category_id"
    t.integer "student_id"
    t.integer "parent_id"
    t.integer "fee_collection_id"
    t.boolean "deleted", default: false
    t.integer "school_id"
  end

  add_index "finance_fee_structure_elements", ["school_id"], name: "index_finance_fee_structure_elements_on_school_id"

  create_table "finance_fees", force: :cascade do |t|
    t.integer "fee_collection_id"
    t.string  "transaction_id"
    t.integer "student_id"
    t.boolean "is_paid", default: false
    t.integer "school_id"
  end

  add_index "finance_fees", %w[fee_collection_id student_id], name: "index_finance_fees_on_fee_collection_id_and_student_id"
  add_index "finance_fees", ["school_id"], name: "index_finance_fees_on_school_id"

  create_table "finance_transaction_categories", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.boolean "is_income"
    t.boolean "deleted", default: false, null: false
    t.integer "school_id"
  end

  add_index "finance_transaction_categories", ["school_id"], name: "index_finance_transaction_categories_on_school_id"

  create_table "finance_transaction_triggers", force: :cascade do |t|
    t.integer "finance_category_id"
    t.decimal "percentage", precision: 8, scale: 2
    t.string  "title"
    t.string  "description"
    t.integer "school_id"
  end

  add_index "finance_transaction_triggers", ["school_id"], name: "index_finance_transaction_triggers_on_school_id"

  create_table "finance_transactions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "amount", precision: 15, scale: 2
    t.boolean  "fine_included", default: false
    t.integer  "category_id"
    t.integer  "student_id"
    t.integer  "finance_fees_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "transaction_date"
    t.decimal  "fine_amount", precision: 10, scale: 2, default: 0.0
    t.integer  "master_transaction_id", default: 0
    t.integer  "finance_id"
    t.string   "finance_type"
    t.integer  "payee_id"
    t.string   "payee_type"
    t.string   "receipt_no"
    t.string   "voucher_no"
    t.integer  "school_id"
  end

  add_index "finance_transactions", ["school_id"], name: "index_finance_transactions_on_school_id"

  create_table "gallery_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_delete", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "gallery_photos", force: :cascade do |t|
    t.integer  "gallery_category_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "name"
    t.integer  "school_id"
  end

  create_table "gallery_tags", force: :cascade do |t|
    t.integer  "gallery_photo_id"
    t.integer  "member_id"
    t.string   "member_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "grading_levels", force: :cascade do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.integer  "min_score"
    t.integer  "order"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.decimal  "credit_points", precision: 15, scale: 2
    t.string   "description"
  end

  add_index "grading_levels", %w[batch_id is_deleted], name: "index_grading_levels_on_batch_id_and_is_deleted"
  add_index "grading_levels", ["school_id"], name: "index_grading_levels_on_school_id"

  create_table "grn_items", force: :cascade do |t|
    t.integer  "grn_id"
    t.integer  "store_item_id"
    t.integer  "quantity"
    t.decimal  "unit_price",    limit: 10, precision: 10, scale: 0
    t.decimal  "tax",           limit: 10, precision: 10, scale: 0
    t.date     "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "grn_items", ["grn_id"], name: "index_grn_items_on_grn_id"
  add_index "grn_items", ["school_id"], name: "index_grn_items_on_school_id"
  add_index "grn_items", ["store_item_id"], name: "index_grn_items_on_store_item_id"

  create_table "grns", force: :cascade do |t|
    t.string   "grn_no"
    t.integer  "supplier_id"
    t.integer  "purchase_order_id"
    t.integer  "store_id"
    t.string   "invoice_no"
    t.date     "grn_date"
    t.date     "invoice_date"
    t.decimal  "other_charges", limit: 10, precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_type_id"
    t.integer  "school_id"
    t.integer  "finance_transaction_id"
  end

  add_index "grns", ["finance_transaction_id"], name: "index_grns_on_finance_transaction_id"
  add_index "grns", ["purchase_order_id"], name: "index_grns_on_purchase_order_id"
  add_index "grns", ["school_id"], name: "index_grns_on_school_id"
  add_index "grns", ["store_id"], name: "index_grns_on_store_id"
  add_index "grns", ["supplier_id"], name: "index_grns_on_supplier_id"
  add_index "grns", ["supplier_type_id"], name: "index_grns_on_supplier_type_id"

  create_table "group_files", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "file_description"
    t.integer  "group_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.integer  "school_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.boolean  "is_admin", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "group_post_comments", force: :cascade do |t|
    t.integer  "group_post_id"
    t.integer  "user_id"
    t.text     "comment_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "group_posts", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "post_title"
    t.text     "post_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "grouped_batches", force: :cascade do |t|
    t.integer  "batch_group_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grouped_batches", ["batch_group_id"], name: "index_grouped_batches_on_batch_group_id"

  create_table "grouped_exam_reports", force: :cascade do |t|
    t.integer  "batch_id"
    t.integer  "student_id"
    t.integer  "exam_group_id"
    t.decimal  "marks", precision: 15, scale: 2
    t.string   "score_type"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grouped_exam_reports", %w[batch_id student_id score_type], name: "by_batch_student_and_score_type"

  create_table "grouped_exams", force: :cascade do |t|
    t.integer "exam_group_id"
    t.integer "batch_id"
    t.integer "school_id"
    t.decimal "weightage", precision: 15, scale: 2
  end

  add_index "grouped_exams", ["batch_id"], name: "index_grouped_exams_on_batch_id"
  add_index "grouped_exams", ["school_id"], name: "index_grouped_exams_on_school_id"

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.text     "group_description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "school_id"
  end

  create_table "guardian_details", force: :cascade do |t|
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guardians", force: :cascade do |t|
    t.integer  "ward_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.string   "email"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.date     "dob"
    t.string   "occupation"
    t.string   "income"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.integer  "user_id"
  end

  add_index "guardians", ["school_id"], name: "index_guardians_on_school_id"

  create_table "hostel_fee_collections", force: :cascade do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "due_date"
    t.boolean  "is_deleted", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "hostel_fees", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "finance_transaction_id"
    t.integer  "hostel_fee_collection_id"
    t.decimal  "rent", precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "hostels", force: :cascade do |t|
    t.string   "name"
    t.string   "hostel_type"
    t.string   "other_info"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "indent_items", force: :cascade do |t|
    t.integer  "indent_id"
    t.integer  "store_item_id"
    t.integer  "quantity"
    t.string   "batch_no"
    t.integer  "pending"
    t.integer  "issued"
    t.string   "issued_type"
    t.decimal  "price", limit: 10, precision: 10, scale: 0
    t.integer  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "indent_items", ["indent_id"], name: "index_indent_items_on_indent_id"
  add_index "indent_items", ["school_id"], name: "index_indent_items_on_school_id"
  add_index "indent_items", ["store_item_id"], name: "index_indent_items_on_store_item_id"

  create_table "indents", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "indent_no"
    t.date     "expected_date"
    t.string   "status"
    t.integer  "employee_department_id"
    t.integer  "manager_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "indents", ["employee_department_id"], name: "index_indents_on_employee_department_id"
  add_index "indents", ["school_id"], name: "index_indents_on_school_id"
  add_index "indents", ["store_id"], name: "index_indents_on_store_id"
  add_index "indents", ["user_id"], name: "index_indents_on_user_id"

  create_table "individual_payslip_categories", force: :cascade do |t|
    t.integer "employee_id"
    t.date    "salary_date"
    t.string  "name"
    t.string  "amount"
    t.boolean "is_deduction"
    t.boolean "include_every_month"
    t.integer "school_id"
  end

  add_index "individual_payslip_categories", ["school_id"], name: "index_individual_payslip_categories_on_school_id"

  create_table "instant_fee_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "instant_fee_details", force: :cascade do |t|
    t.integer  "instant_fee_id"
    t.integer  "instant_fee_particular_id"
    t.string   "custom_particular"
    t.decimal  "amount",                    precision: 15, scale: 2
    t.decimal  "discount",                  precision: 15, scale: 2
    t.decimal  "net_amount",                precision: 15, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "instant_fee_particulars", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "amount", precision: 15, scale: 2
    t.integer  "instant_fee_category_id"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "instant_fees", force: :cascade do |t|
    t.integer  "instant_fee_category_id"
    t.string   "custom_category"
    t.integer  "payee_id"
    t.string   "payee_type"
    t.string   "guest_payee"
    t.decimal  "amount", precision: 15, scale: 2
    t.datetime "pay_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "code"
  end

  create_table "liabilities", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "amount"
    t.boolean  "is_solved",   default: false
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "liabilities", ["school_id"], name: "index_liabilities_on_school_id"

  create_table "library_card_settings", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "student_category_id"
    t.integer  "books_issueable"
    t.integer  "time_period", default: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "marks_details", force: :cascade do |t|
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_payslips", force: :cascade do |t|
    t.date    "salary_date"
    t.integer "employee_id"
    t.integer "payroll_category_id"
    t.string  "amount"
    t.boolean "is_approved", default: false, null: false
    t.integer "approver_id"
    t.boolean "is_rejected", default: false, null: false
    t.integer "rejector_id"
    t.string  "reason"
    t.integer "school_id"
    t.string  "remark"
  end

  add_index "monthly_payslips", ["school_id"], name: "index_monthly_payslips_on_school_id"

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "news", ["school_id"], name: "index_news_on_school_id"

  create_table "news_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "news_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.boolean  "is_approved", default: false
  end

  add_index "news_comments", ["school_id"], name: "index_news_comments_on_school_id"

  create_table "online_exam_attendances", force: :cascade do |t|
    t.integer  "online_exam_group_id"
    t.integer  "student_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "total_score", precision: 7, scale: 2
    t.boolean  "is_passed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "online_exam_groups", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "maximum_time",    precision: 7, scale: 2
    t.decimal  "pass_percentage", precision: 6, scale: 2
    t.integer  "option_count"
    t.integer  "batch_id"
    t.boolean  "is_deleted",                                    default: false
    t.boolean  "is_published",                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "online_exam_options", force: :cascade do |t|
    t.integer  "online_exam_question_id"
    t.text     "option"
    t.boolean  "is_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "online_exam_questions", force: :cascade do |t|
    t.integer  "online_exam_group_id"
    t.text     "question"
    t.decimal  "mark", precision: 7, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "online_exam_score_details", force: :cascade do |t|
    t.integer  "online_exam_question_id"
    t.integer  "online_exam_attendance_id"
    t.integer  "online_exam_option_id"
    t.boolean  "is_correct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "online_meeting_members", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "online_meeting_room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "online_meeting_rooms", force: :cascade do |t|
    t.integer  "server_id"
    t.integer  "user_id"
    t.string   "meetingid"
    t.string   "name"
    t.string   "attendee_password"
    t.string   "moderator_password"
    t.string   "welcome_msg"
    t.string   "logout_url"
    t.string   "voice_bridge"
    t.string   "dial_number"
    t.integer  "max_participants"
    t.boolean  "private",             default: false
    t.boolean  "randomize_meetingid", default: true
    t.boolean  "external",            default: false
    t.string   "param"
    t.datetime "scheduled_on"
    t.boolean  "is_active", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "online_meeting_rooms", ["meetingid"], name: "index_online_meeting_rooms_on_meetingid", unique: true
  add_index "online_meeting_rooms", ["server_id"], name: "index_online_meeting_rooms_on_server_id"
  add_index "online_meeting_rooms", ["voice_bridge"], name: "index_online_meeting_rooms_on_voice_bridge", unique: true

  create_table "online_meeting_servers", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "salt"
    t.string   "version"
    t.string   "param"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "payroll_categories", force: :cascade do |t|
    t.string  "name"
    t.float   "percentage"
    t.integer "payroll_category_id"
    t.boolean "is_deduction"
    t.boolean "status"
    t.integer "school_id"
  end

  add_index "payroll_categories", ["school_id"], name: "index_payroll_categories_on_school_id"

  create_table "period_entries", force: :cascade do |t|
    t.date    "month_date"
    t.integer "batch_id"
    t.integer "subject_id"
    t.integer "class_timing_id"
    t.integer "employee_id"
    t.integer "school_id"
  end

  add_index "period_entries", %w[month_date batch_id], name: "index_period_entries_on_month_date_and_batch_id"
  add_index "period_entries", ["school_id"], name: "index_period_entries_on_school_id"

  create_table "placement_registrations", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "placementevent_id"
    t.boolean  "is_applied", default: false
    t.boolean  "is_approved"
    t.boolean  "is_attended",       default: false
    t.boolean  "is_placed",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "placementevents", force: :cascade do |t|
    t.string   "title"
    t.string   "company"
    t.string   "place"
    t.text     "description"
    t.boolean  "is_active", default: true
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "poll_members", force: :cascade do |t|
    t.integer  "poll_question_id"
    t.integer  "member_id"
    t.string   "member_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "poll_options", force: :cascade do |t|
    t.integer  "poll_question_id"
    t.text     "option"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "poll_questions", force: :cascade do |t|
    t.boolean  "is_active"
    t.string   "title"
    t.text     "description"
    t.boolean  "allow_custom_ans"
    t.integer  "poll_creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "poll_votes", force: :cascade do |t|
    t.integer  "poll_question_id"
    t.integer  "poll_option_id"
    t.string   "custom_answer"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "previous_institutional_details", force: :cascade do |t|
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privileges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "school_id"
  end

  add_index "privileges", ["school_id"], name: "index_privileges_on_school_id"

  create_table "privileges_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "privilege_id"
    t.integer "school_id"
  end

  add_index "privileges_users", ["school_id"], name: "index_privileges_users_on_school_id"
  add_index "privileges_users", ["user_id"], name: "index_privileges_users_on_user_id"

  create_table "purchase_items", force: :cascade do |t|
    t.integer  "purchase_order_id"
    t.integer  "user_id"
    t.integer  "store_item_id"
    t.integer  "quantity"
    t.integer  "discount"
    t.integer  "tax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.decimal  "unit_price", limit: 10, precision: 10, scale: 0
  end

  add_index "purchase_items", ["purchase_order_id"], name: "index_purchase_items_on_purchase_order_id"
  add_index "purchase_items", ["school_id"], name: "index_purchase_items_on_school_id"
  add_index "purchase_items", ["store_item_id"], name: "index_purchase_items_on_store_item_id"
  add_index "purchase_items", ["user_id"], name: "index_purchase_items_on_user_id"

  create_table "purchase_orders", force: :cascade do |t|
    t.string   "po_no"
    t.integer  "store_id"
    t.integer  "supplier_id"
    t.date     "po_date"
    t.string   "reference"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "indent_id"
    t.integer  "supplier_type_id"
    t.string   "po_status"
    t.integer  "school_id"
  end

  add_index "purchase_orders", ["indent_id"], name: "index_purchase_orders_on_indent_id"
  add_index "purchase_orders", ["school_id"], name: "index_purchase_orders_on_school_id"
  add_index "purchase_orders", ["store_id"], name: "index_purchase_orders_on_store_id"
  add_index "purchase_orders", ["supplier_id"], name: "index_purchase_orders_on_supplier_id"
  add_index "purchase_orders", ["supplier_type_id"], name: "index_purchase_orders_on_supplier_type_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranking_levels", force: :cascade do |t|
    t.string   "name", null: false
    t.decimal  "gpa",           precision: 15, scale: 2
    t.decimal  "marks",         precision: 15, scale: 2
    t.integer  "subject_count"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "lower_limit",                                  default: false
    t.boolean  "full_course",                                  default: false
  end

  create_table "registration_courses", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "course_id"
    t.integer  "minimum_score"
    t.boolean  "is_active"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registration_courses", ["course_id"], name: "index_registration_courses_on_course_id"
  add_index "registration_courses", ["school_id"], name: "index_registration_courses_on_school_id"

  create_table "registration_details", force: :cascade do |t|
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "dynamic_attributes"
    t.text     "type"
  end

  create_table "registration_points", force: :cascade do |t|
    t.string   "name"
    t.integer  "point"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "dob"
    t.boolean  "gender"
    t.string   "address"
    t.string   "per_address"
    t.integer  "res_no"
    t.integer  "mob_no"
    t.string   "mother_tongue"
    t.string   "religion"
    t.integer  "community_reservation_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "reg_no"
    t.integer  "batch_id"
    t.boolean  "acceptance_status"
    t.integer  "total_mark"
    t.integer  "subject_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.integer  "sender"
    t.integer  "recipient"
    t.string   "subject"
    t.text     "body"
    t.boolean  "is_read",                 default: false
    t.boolean  "is_deleted_by_sender",    default: false
    t.boolean  "is_deleted_by_recipient", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "reminders", ["recipient"], name: "index_reminders_on_recipient"
  add_index "reminders", ["school_id"], name: "index_reminders_on_school_id"

  create_table "report_columns", force: :cascade do |t|
    t.integer  "report_id"
    t.string   "title"
    t.string   "method"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "report_columns", ["report_id"], name: "index_report_columns_on_report_id"

  create_table "report_queries", force: :cascade do |t|
    t.integer  "report_id"
    t.string   "table_name"
    t.string   "column_name"
    t.string   "criteria"
    t.text     "query"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "column_type"
    t.integer  "school_id"
  end

  add_index "report_queries", ["report_id"], name: "index_report_queries_on_report_id"

  create_table "reports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "model"
    t.integer  "school_id"
  end

  create_table "room_allocations", force: :cascade do |t|
    t.integer  "room_detail_id"
    t.integer  "student_id"
    t.boolean  "is_vacated", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "room_details", force: :cascade do |t|
    t.integer  "hostel_id"
    t.string   "room_number"
    t.integer  "students_per_room"
    t.decimal  "rent", precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "destination"
    t.string   "cost"
    t.integer  "main_route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "school_assets", force: :cascade do |t|
    t.string   "asset_name"
    t.string   "asset_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "school_details", force: :cascade do |t|
    t.integer  "school_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.string   "logo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sms_logs", force: :cascade do |t|
    t.string   "mobile"
    t.string   "gateway_response"
    t.string   "sms_message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "sms_messages", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "sms_settings", force: :cascade do |t|
    t.string  "settings_key"
    t.boolean "is_enabled", default: false
    t.integer "school_id"
  end

  add_index "sms_settings", ["school_id"], name: "index_sms_settings_on_school_id"

  create_table "store_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "store_categories", ["school_id"], name: "index_store_categories_on_school_id"

  create_table "store_items", force: :cascade do |t|
    t.integer  "store_id"
    t.string   "item_name"
    t.integer  "quantity"
    t.decimal  "unit_price", limit: 10, precision: 10, scale: 0
    t.decimal  "tax",        limit: 10, precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "store_items", ["school_id"], name: "index_store_items_on_school_id"
  add_index "store_items", ["store_id"], name: "index_store_items_on_store_id"

  create_table "store_types", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "store_types", ["school_id"], name: "index_store_types_on_school_id"

  create_table "stores", force: :cascade do |t|
    t.integer  "store_type_id"
    t.integer  "store_category_id"
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "stores", ["school_id"], name: "index_stores_on_school_id"
  add_index "stores", ["store_category_id"], name: "index_stores_on_store_category_id"
  add_index "stores", ["store_type_id"], name: "index_stores_on_store_type_id"

  create_table "streams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_additional_details", force: :cascade do |t|
    t.integer "student_id"
    t.integer "additional_field_id"
    t.string  "additional_info"
    t.integer "school_id"
  end

  add_index "student_additional_details", ["school_id"], name: "index_student_additional_details_on_school_id"

  create_table "student_additional_fields", force: :cascade do |t|
    t.string  "name"
    t.boolean "status"
    t.integer "school_id"
  end

  add_index "student_additional_fields", ["school_id"], name: "index_student_additional_fields_on_school_id"

  create_table "student_categories", force: :cascade do |t|
    t.string  "name"
    t.boolean "is_deleted", default: false, null: false
    t.integer "school_id"
  end

  add_index "student_categories", ["school_id"], name: "index_student_categories_on_school_id"

  create_table "student_previous_datas", force: :cascade do |t|
    t.integer "student_id"
    t.string  "institution"
    t.date    "year"
    t.string  "course"
    t.string  "total_mark"
    t.integer "school_id"
  end

  add_index "student_previous_datas", ["school_id"], name: "index_student_previous_datas_on_school_id"

  create_table "student_previous_subject_marks", force: :cascade do |t|
    t.integer "student_id"
    t.string  "subject"
    t.string  "mark"
    t.integer "school_id"
  end

  add_index "student_previous_subject_marks", ["school_id"], name: "index_student_previous_subject_marks_on_school_id"

  create_table "students", force: :cascade do |t|
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "birth_place"
    t.integer  "nationality_id"
    t.string   "language"
    t.string   "religion"
    t.integer  "student_category_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "pin_code"
    t.integer  "country_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.integer  "immediate_contact_id"
    t.boolean  "is_sms_enabled", default: true
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.binary   "photo_data", limit: 16_777_215
    t.string   "status_description"
    t.boolean  "is_active",                                default: true
    t.boolean  "is_deleted",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "library_card"
    t.boolean  "has_paid_fees", default: false
    t.integer  "photo_file_size"
    t.integer  "user_id"
    t.text     "passport_number"
    t.date     "enrollment_date"
    t.integer  "school_id"
  end

  add_index "students", ["admission_no"], name: "index_students_on_admission_no"
  add_index "students", ["batch_id"], name: "index_students_on_batch_id"
  add_index "students", %w[first_name middle_name last_name],
            name: "index_students_on_first_name_and_middle_name_and_last_name"
  add_index "students", ["school_id"], name: "index_students_on_school_id"

  create_table "students_subjects", force: :cascade do |t|
    t.integer "student_id"
    t.integer "subject_id"
    t.integer "batch_id"
    t.integer "school_id"
  end

  add_index "students_subjects", ["school_id"], name: "index_students_subjects_on_school_id"
  add_index "students_subjects", %w[student_id subject_id], name: "index_students_subjects_on_student_id_and_subject_id"

  create_table "subject_choices", force: :cascade do |t|
    t.integer  "registration_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_leaves", force: :cascade do |t|
    t.integer  "student_id"
    t.date     "month_date"
    t.integer  "subject_id"
    t.integer  "employee_id"
    t.integer  "class_timing_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "subject_leaves", %w[month_date subject_id batch_id],
            name: "index_subject_leaves_on_month_date_and_subject_id_and_batch_id"
  add_index "subject_leaves", %w[student_id batch_id], name: "index_subject_leaves_on_student_id_and_batch_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "batch_id"
    t.boolean  "no_exams", default: false
    t.integer  "max_weekly_classes"
    t.integer  "elective_group_id"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.boolean  "language", default: false
    t.decimal  "credit_hours", precision: 15, scale: 2
    t.boolean  "prefer_consecutive", default: false
    t.decimal  "amount", precision: 15, scale: 2
  end

  add_index "subjects", %w[batch_id elective_group_id is_deleted],
            name: "index_subjects_on_batch_id_and_elective_group_id_and_is_deleted"
  add_index "subjects", ["school_id"], name: "index_subjects_on_school_id"

  create_table "supplier_types", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "supplier_types", ["school_id"], name: "index_supplier_types_on_school_id"

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.integer  "contact_no", limit: 8
    t.text     "address"
    t.string   "tin_no"
    t.string   "region"
    t.text     "help_desk"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_type_id"
    t.integer  "school_id"
  end

  add_index "suppliers", ["school_id"], name: "index_suppliers_on_school_id"
  add_index "suppliers", ["supplier_type_id"], name: "index_suppliers_on_supplier_type_id"

  create_table "sync_updates", force: :cascade do |t|
    t.string   "changed_record_type"
    t.integer  "changed_record_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.integer  "school_id"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", %w[taggable_id taggable_type], name: "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "school_id"
  end

  create_table "task_assignees", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "assignee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "task_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "description"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.date     "start_date"
    t.date     "due_date"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "test", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "timetable_entries", force: :cascade do |t|
    t.integer "batch_id"
    t.integer "weekday_id"
    t.integer "class_timing_id"
    t.integer "subject_id"
    t.integer "employee_id"
    t.integer "school_id"
    t.integer "timetable_id"
  end

  add_index "timetable_entries", ["school_id"], name: "index_timetable_entries_on_school_id"
  add_index "timetable_entries", ["timetable_id"], name: "index_timetable_entries_on_timetable_id"

  create_table "timetables", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_active", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timetables", %w[start_date end_date], name: "by_start_and_end"

  create_table "transport_fee_collections", force: :cascade do |t|
    t.string  "name"
    t.integer "batch_id"
    t.date    "start_date"
    t.date    "end_date"
    t.date    "due_date"
    t.boolean "is_deleted", default: false, null: false
    t.integer "school_id"
  end

  create_table "transport_fees", force: :cascade do |t|
    t.integer  "receiver_id"
    t.decimal  "bus_fare", precision: 8, scale: 2
    t.integer  "transaction_id"
    t.integer  "transport_fee_collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "receiver_type"
    t.integer  "school_id"
  end

  create_table "transports", force: :cascade do |t|
    t.integer  "receiver_id"
    t.integer  "vehicle_id"
    t.integer  "route_id"
    t.string   "bus_fare"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "receiver_type"
    t.integer  "school_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "user_events", ["school_id"], name: "index_user_events_on_school_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "admin"
    t.boolean  "student"
    t.boolean  "employee"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "reset_password_code"
    t.datetime "reset_password_code_until"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.boolean  "parent"
  end

  add_index "users", ["school_id"], name: "index_users_on_school_id"
  add_index "users", ["username"], name: "index_users_on_username"

  create_table "vehicles", force: :cascade do |t|
    t.string   "vehicle_no"
    t.integer  "main_route_id"
    t.integer  "no_of_seats"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "wardens", force: :cascade do |t|
    t.integer  "hostel_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "weekdays", force: :cascade do |t|
    t.integer "batch_id"
    t.string  "weekday"
    t.integer "school_id"
    t.string  "name"
    t.integer "sort_order"
    t.integer "day_of_week"
    t.boolean "is_deleted", default: false
  end

  add_index "weekdays", ["batch_id"], name: "index_weekdays_on_batch_id"
  add_index "weekdays", ["school_id"], name: "index_weekdays_on_school_id"

  create_table "xmls", force: :cascade do |t|
    t.string   "finance_name"
    t.string   "ledger_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
