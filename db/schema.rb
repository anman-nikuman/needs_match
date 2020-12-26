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

ActiveRecord::Schema.define(version: 2020_12_25_170546) do

  create_table "affiliations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.bigint "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_affiliations_on_branch_id"
    t.index ["staff_id"], name: "index_affiliations_on_staff_id"
  end

  create_table "branches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "area", null: false
    t.integer "evaluation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation"], name: "index_branches_on_evaluation"
    t.index ["name"], name: "index_branches_on_name", unique: true
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "nm_id", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "name_kana", null: false
    t.string "company_name"
    t.string "department"
    t.string "position"
    t.string "industry"
    t.string "home_postal_code"
    t.string "home_address"
    t.string "company_postal_code"
    t.string "conpany_address"
    t.date "expiration_date"
    t.boolean "is_deleted", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.datetime "date", null: false
    t.string "station1"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "station2"
    t.string "prefecture_code"
    t.index ["branch_id"], name: "index_events_on_branch_id"
    t.index ["date"], name: "index_events_on_date"
  end

  create_table "introductions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.integer "source", null: false
    t.integer "destination", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_introductions_on_customer_id"
  end

  create_table "operations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "staff_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_operations_on_event_id"
    t.index ["staff_id"], name: "index_operations_on_staff_id"
  end

  create_table "staffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nm_id", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["family_name", "given_name"], name: "index_staffs_on_family_name_and_given_name"
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  add_foreign_key "affiliations", "branches"
  add_foreign_key "affiliations", "staffs"
  add_foreign_key "events", "branches"
  add_foreign_key "introductions", "customers"
  add_foreign_key "operations", "events"
end
