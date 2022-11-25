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

ActiveRecord::Schema.define(version: 20200814160402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.string   "picture"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "video"
    t.integer  "purpose"
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id", using: :btree
  end

  create_table "blocks", force: :cascade do |t|
    t.integer  "student_profile_id"
    t.integer  "company_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["company_profile_id"], name: "index_blocks_on_company_profile_id", using: :btree
    t.index ["student_profile_id"], name: "index_blocks_on_student_profile_id", using: :btree
  end

  create_table "certificates", force: :cascade do |t|
    t.integer  "student_profile_id"
    t.string   "pdf"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "title",              null: false
    t.date     "finished_at"
    t.string   "institution_name"
    t.index ["student_profile_id"], name: "index_certificates_on_student_profile_id", using: :btree
  end

  create_table "company_profiles", force: :cascade do |t|
    t.string   "name",                                         null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "contact_person"
    t.string   "industry_sector"
    t.integer  "number_of_employees"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.text     "what_we_do"
    t.text     "why_we_do_it"
    t.text     "why_you_should_join_our_team"
    t.text     "special_features"
    t.string   "home_page"
    t.string   "youtube_link"
    t.string   "facebok_link"
    t.string   "twitter_link"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "contact_email"
    t.boolean  "profile_complete",             default: false
    t.string   "instagram_link"
  end

  create_table "conversation_messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "content"
    t.index ["conversation_id"], name: "index_conversation_messages_on_conversation_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "company_profile_id"
    t.integer  "student_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["company_profile_id"], name: "index_conversations_on_company_profile_id", using: :btree
    t.index ["student_profile_id"], name: "index_conversations_on_student_profile_id", using: :btree
  end

  create_table "education_entries", force: :cascade do |t|
    t.date     "from"
    t.date     "to"
    t.string   "school_name"
    t.string   "city"
    t.string   "country"
    t.decimal  "grade_point_average"
    t.integer  "student_profile_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "educational_level",   null: false
    t.string   "course"
    t.string   "area_of_graduation"
    t.index ["student_profile_id"], name: "index_education_entries_on_student_profile_id", using: :btree
  end

  create_table "hunts", force: :cascade do |t|
    t.integer  "company_profile_id"
    t.integer  "student_profile_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "state",              default: 0, null: false
    t.index ["company_profile_id"], name: "index_hunts_on_company_profile_id", using: :btree
    t.index ["student_profile_id"], name: "index_hunts_on_student_profile_id", using: :btree
  end

  create_table "interests", force: :cascade do |t|
    t.string   "label",      null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_offer_interests", force: :cascade do |t|
    t.integer  "job_offer_id"
    t.integer  "interest_id"
    t.boolean  "must_have",    default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["interest_id"], name: "index_job_offer_interests_on_interest_id", using: :btree
    t.index ["job_offer_id"], name: "index_job_offer_interests_on_job_offer_id", using: :btree
  end

  create_table "job_offer_skills", force: :cascade do |t|
    t.integer "job_offer_id"
    t.integer "skill_id"
    t.boolean "must_have",    default: false, null: false
    t.index ["job_offer_id"], name: "index_job_offer_skills_on_job_offer_id", using: :btree
    t.index ["skill_id"], name: "index_job_offer_skills_on_skill_id", using: :btree
  end

  create_table "job_offer_strengths", force: :cascade do |t|
    t.integer  "job_offer_id"
    t.integer  "strength_id"
    t.boolean  "must_have",    default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["job_offer_id"], name: "index_job_offer_strengths_on_job_offer_id", using: :btree
    t.index ["strength_id"], name: "index_job_offer_strengths_on_strength_id", using: :btree
  end

  create_table "job_offers", force: :cascade do |t|
    t.integer  "category",                                                      null: false
    t.text     "content",                                                       null: false
    t.text     "what_is_expected_from_you",                                     null: false
    t.text     "what_is_expected_from_us",                                      null: false
    t.text     "tasks",                                                         null: false
    t.string   "city",                                                          null: false
    t.date     "start",                                                         null: false
    t.integer  "free_places",                                                   null: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "company_profile_id",                                            null: false
    t.string   "country",                                                       null: false
    t.string   "postal_code",                                                   null: false
    t.decimal  "latitude",                                                      null: false
    t.decimal  "longitude",                                                     null: false
    t.integer  "state",                                             default: 0
    t.text     "perspectives"
    t.integer  "wage_period"
    t.date     "end_date"
    t.float    "working_hours_per_week"
    t.decimal  "wage",                      precision: 8, scale: 2
    t.string   "street"
    t.integer  "minimum_degree"
    t.string   "web_site_link"
    t.index ["company_profile_id"], name: "index_job_offers_on_company_profile_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "job_offer_id"
    t.integer  "student_profile_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "state",              default: 0
    t.index ["job_offer_id"], name: "index_likes_on_job_offer_id", using: :btree
    t.index ["student_profile_id"], name: "index_likes_on_student_profile_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.string   "text"
    t.string   "url"
    t.integer  "kind"
    t.integer  "company_profile_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "university_profile_id"
    t.index ["company_profile_id"], name: "index_links_on_company_profile_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "label",      null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strengths", force: :cascade do |t|
    t.string   "label",      null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_profile_interests", force: :cascade do |t|
    t.integer  "interest_id"
    t.integer  "student_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["interest_id"], name: "index_student_profile_interests_on_interest_id", using: :btree
    t.index ["student_profile_id"], name: "index_student_profile_interests_on_student_profile_id", using: :btree
  end

  create_table "student_profile_skills", force: :cascade do |t|
    t.integer  "student_profile_id"
    t.integer  "skill_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["skill_id"], name: "index_student_profile_skills_on_skill_id", using: :btree
    t.index ["student_profile_id"], name: "index_student_profile_skills_on_student_profile_id", using: :btree
  end

  create_table "student_profile_strengths", force: :cascade do |t|
    t.integer  "student_profile_id"
    t.integer  "strength_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["strength_id"], name: "index_student_profile_strengths_on_strength_id", using: :btree
    t.index ["student_profile_id"], name: "index_student_profile_strengths_on_student_profile_id", using: :btree
  end

  create_table "student_profiles", force: :cascade do |t|
    t.string   "name",                                       null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.date     "date_of_birth"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.string   "graduation"
    t.decimal  "grade_point_average"
    t.date     "available_from"
    t.integer  "mobility"
    t.text     "other_skills_and_interests"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "video"
    t.string   "speciality"
    t.boolean  "driving_license"
    t.boolean  "profile_complete",           default: false
    t.integer  "current_job_status"
    t.integer  "highest_graduation_level"
    t.string   "area_of_graduation"
    t.integer  "gender",                     default: 0
  end

  create_table "subject_likes", force: :cascade do |t|
    t.integer  "subject_offer_id"
    t.integer  "student_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "company_profile_id"
    t.index ["company_profile_id"], name: "index_subject_likes_on_company_profile_id", using: :btree
    t.index ["student_profile_id"], name: "index_subject_likes_on_student_profile_id", using: :btree
    t.index ["subject_offer_id"], name: "index_subject_likes_on_subject_offer_id", using: :btree
  end

  create_table "subject_offer_interests", force: :cascade do |t|
    t.integer  "subject_offer_id"
    t.integer  "interest_id"
    t.boolean  "must_have",        default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["interest_id"], name: "index_subject_offer_interests_on_interest_id", using: :btree
    t.index ["subject_offer_id"], name: "index_subject_offer_interests_on_subject_offer_id", using: :btree
  end

  create_table "subject_offer_skills", force: :cascade do |t|
    t.integer "subject_offer_id"
    t.integer "skill_id"
    t.boolean "must_have",        default: false, null: false
    t.index ["skill_id"], name: "index_subject_offer_skills_on_skill_id", using: :btree
    t.index ["subject_offer_id"], name: "index_subject_offer_skills_on_subject_offer_id", using: :btree
  end

  create_table "subject_offer_strengths", force: :cascade do |t|
    t.integer  "subject_offer_id"
    t.integer  "strength_id"
    t.boolean  "must_have",        default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["strength_id"], name: "index_subject_offer_strengths_on_strength_id", using: :btree
    t.index ["subject_offer_id"], name: "index_subject_offer_strengths_on_subject_offer_id", using: :btree
  end

  create_table "subject_offers", force: :cascade do |t|
    t.string   "name"
    t.integer  "type_of_degree"
    t.text     "content"
    t.text     "perspectives"
    t.text     "tests"
    t.string   "postal_code"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.float    "latitude"
    t.float    "longitude"
    t.date     "start_date"
    t.integer  "duration_in_hours"
    t.integer  "cost_period"
    t.decimal  "cost_amount"
    t.integer  "hours_of_classes_per_week"
    t.integer  "number_of_places"
    t.integer  "minimum_degree"
    t.integer  "state"
    t.integer  "university_profile_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.float    "nummerus_clausus"
    t.string   "web_site_link"
    t.string   "start_dates",               default: [],              array: true
    t.index ["university_profile_id"], name: "index_subject_offers_on_university_profile_id", using: :btree
  end

  create_table "university_profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_of_students"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.string   "special_features"
    t.string   "postal_code"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "we_are"
    t.text     "why_should_you_study_here"
    t.text     "subject_areas"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "profile_complete",          default: false
    t.integer  "type_of_university"
    t.string   "home_page"
    t.string   "youtube_link"
    t.string   "facebok_link"
    t.string   "twitter_link"
    t.string   "contact_email"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                    null: false
    t.string   "password_digest"
    t.string   "profile_type"
    t.integer  "profile_id"
    t.integer  "chat_notifications_count", default: 0
    t.boolean  "email_confirmed",          default: false
    t.string   "confirm_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "facebook_id"
    t.index ["profile_type", "profile_id"], name: "index_users_on_profile_type_and_profile_id", using: :btree
  end

  create_table "work_experiences", force: :cascade do |t|
    t.date     "from",               null: false
    t.integer  "kind",               null: false
    t.string   "company_name",       null: false
    t.string   "department",         null: false
    t.string   "city",               null: false
    t.string   "country",            null: false
    t.string   "title",              null: false
    t.text     "tasks"
    t.integer  "student_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "to"
    t.index ["student_profile_id"], name: "index_work_experiences_on_student_profile_id", using: :btree
  end

  add_foreign_key "blocks", "company_profiles"
  add_foreign_key "blocks", "student_profiles"
  add_foreign_key "certificates", "student_profiles"
  add_foreign_key "conversation_messages", "conversations"
  add_foreign_key "conversations", "company_profiles"
  add_foreign_key "conversations", "student_profiles"
  add_foreign_key "education_entries", "student_profiles"
  add_foreign_key "hunts", "company_profiles"
  add_foreign_key "hunts", "student_profiles"
  add_foreign_key "job_offer_interests", "interests"
  add_foreign_key "job_offer_interests", "job_offers"
  add_foreign_key "job_offer_skills", "job_offers"
  add_foreign_key "job_offer_skills", "skills"
  add_foreign_key "job_offer_strengths", "job_offers"
  add_foreign_key "job_offer_strengths", "strengths"
  add_foreign_key "job_offers", "company_profiles"
  add_foreign_key "likes", "job_offers"
  add_foreign_key "likes", "student_profiles"
  add_foreign_key "student_profile_interests", "interests"
  add_foreign_key "student_profile_interests", "student_profiles"
  add_foreign_key "student_profile_skills", "skills"
  add_foreign_key "student_profile_skills", "student_profiles"
  add_foreign_key "student_profile_strengths", "strengths"
  add_foreign_key "student_profile_strengths", "student_profiles"
  add_foreign_key "subject_likes", "company_profiles"
  add_foreign_key "subject_likes", "student_profiles"
  add_foreign_key "subject_likes", "subject_offers"
  add_foreign_key "subject_offer_interests", "interests"
  add_foreign_key "subject_offer_interests", "subject_offers"
  add_foreign_key "subject_offer_skills", "skills"
  add_foreign_key "subject_offer_skills", "subject_offers"
  add_foreign_key "subject_offer_strengths", "strengths"
  add_foreign_key "subject_offer_strengths", "subject_offers"
  add_foreign_key "subject_offers", "university_profiles"
  add_foreign_key "work_experiences", "student_profiles"
end
