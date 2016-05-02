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

ActiveRecord::Schema.define(version: 20160414170213) do

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.float    "longitude"
    t.float    "latitude"
    t.text     "description"
    t.string   "is_kind"
    t.integer  "quad_id"
    t.string   "years"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "up_vote"
    t.integer  "user_id"
    t.integer  "board_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"

  create_table "posts", force: :cascade do |t|
    t.text     "text"
    t.datetime "posted"
    t.integer  "line_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quads", force: :cascade do |t|
    t.string   "name"
    t.string   "years"
    t.float    "rating"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "text"
    t.integer  "up_vote"
    t.float    "rating"
    t.integer  "user_id"
    t.integer  "building_id"
    t.integer  "room_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "number"
    t.string   "years_available"
    t.string   "room_type"
    t.string   "gender"
    t.decimal  "price",             precision: 6, scale: 2
    t.float    "area"
    t.string   "dimensions"
    t.integer  "floor"
    t.integer  "rough_housing_num"
    t.integer  "building_id"
    t.string   "x_coordinate"
    t.string   "y_coordinate"
    t.float    "cleanliness"
    t.float    "noisiness"
    t.float    "light"
    t.float    "social"
    t.float    "location"
    t.float    "issues"
    t.float    "general_rating"
    t.boolean  "kitchen"
    t.boolean  "laundry"
    t.boolean  "ac"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "email"
    t.text     "bio"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.boolean  "admin?"
    t.integer  "pref_price"
    t.integer  "pref_size"
    t.integer  "pref_clean"
    t.integer  "pref_noise"
    t.integer  "pref_location"
    t.integer  "pref_ac"
    t.integer  "pref_social"
    t.integer  "housing_number"
    t.string   "pref_year"
    t.string   "pref_gender"
    t.string   "pref_bedtime"
    t.string   "pref_room_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
