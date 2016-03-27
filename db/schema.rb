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

ActiveRecord::Schema.define(version: 20160327074435) do

  create_table "judges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "submit_id"
    t.integer  "test_case_id"
    t.string   "status",                           default: "Judging", null: false
    t.string   "paiza_api_id",                                         null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "paiza_error_msg",    limit: 65535
    t.text     "paiza_build_stderr", limit: 65535
    t.text     "paiza_stderr",       limit: 65535
    t.string   "paiza_time"
    t.integer  "paiza_memory"
    t.string   "paiza_result"
    t.text     "paiza_stdout",       limit: 65535
  end

  add_index "judges", ["submit_id"], name: "index_judges_on_submit_id", using: :btree
  add_index "judges", ["test_case_id"], name: "index_judges_on_test_case_id", using: :btree

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "display"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                     null: false
    t.text     "question",   limit: 65535,                 null: false
    t.integer  "point",                                    null: false
    t.boolean  "opened",                   default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "submits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.integer  "problem_id"
    t.text     "code",        limit: 65535
    t.string   "status",                    default: "WJ", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "submits", ["language_id"], name: "index_submits_on_language_id", using: :btree
  add_index "submits", ["problem_id"], name: "index_submits_on_problem_id", using: :btree
  add_index "submits", ["user_id"], name: "index_submits_on_user_id", using: :btree

  create_table "test_cases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "input",      limit: 65535, null: false
    t.text     "output",     limit: 65535, null: false
    t.integer  "problem_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "test_cases", ["problem_id"], name: "index_test_cases_on_problem_id", using: :btree

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "administor",             default: false, null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "judges", "submits"
  add_foreign_key "judges", "test_cases"
  add_foreign_key "submits", "languages"
  add_foreign_key "submits", "problems"
  add_foreign_key "submits", "users"
end
