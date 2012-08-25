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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120825002704) do

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.text     "comment"
    t.boolean  "approved",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "source"
  end

  create_table "jobs", :force => true do |t|
    t.string   "client_name"
    t.string   "client_email"
    t.text     "description"
    t.datetime "initial_date"
    t.datetime "task_list_complete"
    t.datetime "proposal_date"
    t.string   "proposer"
    t.datetime "acceptance_date"
    t.integer  "proposal_amount"
    t.string   "responsible_partner"
    t.string   "master"
    t.string   "status"
    t.integer  "percent_complete"
    t.string   "member"
    t.datetime "completion_date"
    t.integer  "contract_amount"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "job_name"
    t.text     "comments"
  end

  create_table "tasks", :force => true do |t|
    t.string   "task_name"
    t.string   "job_name"
    t.text     "description"
    t.string   "member"
    t.string   "master"
    t.float    "hours"
    t.string   "skill"
    t.datetime "start_date"
    t.datetime "completion_date"
    t.string   "status"
    t.integer  "percent_complete"
    t.text     "comments"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "timecards", :force => true do |t|
    t.string   "name"
    t.string   "task"
    t.text     "description"
    t.float    "hours"
    t.datetime "date"
    t.float    "rate"
    t.boolean  "approved"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "email"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "approval",               :default => false
    t.string   "password_digest"
    t.string   "role"
    t.string   "mail"
    t.string   "telephone"
    t.text     "comment"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
