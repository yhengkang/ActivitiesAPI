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

ActiveRecord::Schema.define(:version => 20140115050323) do

  create_table "activities", :force => true do |t|
    t.string   "activity_name", :null => false
    t.string   "vendor",        :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "activities", ["activity_name", "vendor"], :name => "index_activities_on_activity_name_and_vendor", :unique => true

  create_table "availabilities", :force => true do |t|
    t.integer  "activity_id", :null => false
    t.date     "date",        :null => false
    t.time     "start_time",  :null => false
    t.time     "end_time",    :null => false
    t.float    "price",       :null => false
    t.integer  "spaces",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "availabilities", ["activity_id"], :name => "index_availabilities_on_activity_id"

end
