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

ActiveRecord::Schema.define(version: 20150214182953) do

  create_table "attachments", force: true do |t|
    t.integer  "message_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "attachments", ["message_id"], name: "index_attachments_on_message_id"
  add_index "attachments", ["task_id"], name: "index_attachments_on_task_id"

  create_table "consents", force: true do |t|
    t.integer  "user_id"
    t.integer  "procedure_id"
    t.boolean  "indications_complete",  default: false
    t.boolean  "benefits_complete",     default: false
    t.boolean  "risks_complete",        default: false
    t.boolean  "alternatives_complete", default: false
    t.boolean  "description_complete",  default: false
    t.boolean  "consent_complete",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "user_id"
    t.string   "job_type"
    t.boolean  "complete"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "total_time"
  end

  add_index "jobs", ["job_type"], name: "index_jobs_on_job_type"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "messages", force: true do |t|
    t.integer  "job_id"
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.string   "subject"
    t.text     "body"
    t.string   "location_submitted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mailgun_id"
    t.string   "mailgun_reply_to_id"
    t.string   "mailgun_response"
  end

  add_index "messages", ["job_id"], name: "index_messages_on_job_id"
  add_index "messages", ["mailgun_id"], name: "index_messages_on_mailgun_id"
  add_index "messages", ["mailgun_reply_to_id"], name: "index_messages_on_mailgun_reply_to_id"

  create_table "procedure_details", force: true do |t|
    t.integer  "procedure_id"
    t.text     "indications_text"
    t.text     "benefits_text"
    t.text     "risks_text"
    t.text     "alternatives_text"
    t.text     "description_text"
    t.text     "post_op_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer "job_id"
    t.string  "task_type"
    t.boolean "complete"
  end

  add_index "tasks", ["job_id"], name: "index_tasks_on_job_id"
  add_index "tasks", ["task_type"], name: "index_tasks_on_task_type"

  create_table "timers", force: true do |t|
    t.integer  "task_id"
    t.integer  "proofreader_id"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "timers", ["proofreader_id"], name: "index_timers_on_proofreader_id"
  add_index "timers", ["task_id"], name: "index_timers_on_task_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "telephone"
    t.text     "internal_bio"
    t.integer  "role",                   default: 0
    t.integer  "credits",                default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role"], name: "index_users_on_role"

end
