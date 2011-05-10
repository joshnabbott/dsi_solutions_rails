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

ActiveRecord::Schema.define(:version => 20110509203456) do

  create_table "distributors", :force => true do |t|
    t.string   "name"
    t.string   "initials"
    t.string   "logo"
    t.string   "interests"
    t.string   "tac"
    t.text     "description"
    t.text     "terms"
    t.boolean  "is_deleted",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.string   "response"
    t.boolean  "is_deleted", :default => false
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
    t.boolean  "is_public",      :default => false
    t.boolean  "is_deleted",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "comments"
    t.text     "body"
    t.boolean  "is_public",  :default => false
    t.boolean  "is_deleted", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saveds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.string   "saved_type"
    t.string   "text"
    t.integer  "number"
    t.datetime "day_month_year"
    t.datetime "health"
    t.datetime "auto"
    t.datetime "general"
    t.datetime "property"
    t.datetime "umbrella"
    t.boolean  "is_deleted",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "distributor_id"
    t.integer  "logins"
    t.string   "username"
    t.string   "password"
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
    t.string   "new"
    t.datetime "signed_up"
    t.datetime "last_login"
    t.boolean  "is_admin",                              :default => false
    t.boolean  "is_updated",                            :default => false
    t.boolean  "is_active",                             :default => false
    t.boolean  "is_deleted",                            :default => false
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
