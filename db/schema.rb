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

ActiveRecord::Schema.define(version: 20170207202225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.integer  "lead_id"
    t.text     "notes"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_connections_on_lead_id", using: :btree
  end

  create_table "emails", force: :cascade do |t|
    t.integer  "lead_id"
    t.text     "notes"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_emails_on_lead_id", using: :btree
  end

  create_table "interviews", force: :cascade do |t|
    t.integer  "lead_id"
    t.text     "notes"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_interviews_on_lead_id", using: :btree
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "lead_id"
    t.text     "notes"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_invites_on_lead_id", using: :btree
  end

  create_table "leads", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "company"
    t.string   "email_address"
    t.string   "job_title"
    t.string   "phone"
    t.text     "notes"
    t.datetime "last_action"
    t.boolean  "archived",      default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_leads_on_user_id", using: :btree
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "lead_id"
    t.text     "notes"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_meetings_on_lead_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "lead_id"
    t.text     "notes"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_offers_on_lead_id", using: :btree
  end

end
