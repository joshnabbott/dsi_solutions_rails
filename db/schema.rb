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

ActiveRecord::Schema.define(:version => 20110509181937) do

  create_table "distributors", :force => true do |t|
    t.string   "name"
    t.string   "initials"
    t.text     "description"
    t.string   "logo"
    t.string   "interests"
    t.text     "terms"
    t.string   "tac"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.integer  "distributor_id"
    t.integer  "parent_id"
    t.string   "name"
    t.text     "description"
    t.text     "body"
    t.string   "link"
    t.string   "sublink"
    t.boolean  "is_public"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "comments"
    t.text     "body"
    t.boolean  "is_public"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saveds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.string   "saved_type"
    t.string   "txt"
    t.integer  "num"
    t.string   "dmy"
    t.string   "distributor_health"
    t.string   "distributor_auto"
    t.string   "distributor_general"
    t.string   "distributor_property"
    t.string   "distributor_umbrella"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "distributor_id"
    t.string   "username"
    t.string   "password"
    t.integer  "logins"
    t.string   "name_first"
    t.string   "name_last"
    t.string   "company"
    t.string   "annual_volume"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone_office"
    t.string   "phone_cell"
    t.string   "fax"
    t.string   "website"
    t.datetime "signed_up"
    t.datetime "last_login"
    t.string   "new"
    t.boolean  "is_admin"
    t.boolean  "is_updated"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
