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

ActiveRecord::Schema.define(:version => 20140512213800) do

  create_table "advertisers", :force => true do |t|
    t.string   "name"
    t.integer  "publisher_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "advertisers", ["publisher_id"], :name => "index_advertisers_on_publisher_id"

  create_table "deals", :force => true do |t|
    t.string   "proposition"
    t.integer  "value"
    t.integer  "price"
    t.integer  "advertiser_id"
    t.integer  "inventory",     :default => 10, :null => false
    t.text     "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "sold_out"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "import_errors", :force => true do |t|
    t.string   "data"
    t.string   "error"
    t.integer  "import_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "import_maps", :force => true do |t|
    t.string   "field_transforms"
    t.string   "header_transforms"
    t.string   "header_parse_regex"
    t.string   "field_parse_regex"
    t.integer  "import_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "imports", :force => true do |t|
    t.integer  "publisher_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "field_transforms"
    t.string   "header_transforms"
    t.string   "header_parse_regex"
    t.string   "field_parse_regex"
  end

  create_table "issues", :force => true do |t|
    t.integer  "publisher_id"
    t.integer  "import_id"
    t.integer  "deal_id"
    t.string   "message"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.string   "theme"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "publishers", ["parent_id"], :name => "index_publishers_on_parent_id"

end
