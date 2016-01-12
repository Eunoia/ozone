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

ActiveRecord::Schema.define(version: 20160112033528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "districts", primary_key: "gid", force: :cascade do |t|
    t.decimal  "perimeter"
    t.string   "overlay",    limit: 254
    t.date     "date_expir"
    t.string   "time_expir", limit: 254
    t.decimal  "area"
    t.string   "basezone",   limit: 254
    t.string   "znlabel",    limit: 254
    t.string   "ordinance",  limit: 254
    t.date     "date_updat"
    t.string   "time_updat", limit: 254
    t.date     "date_effct"
    t.string   "time_effct", limit: 254
    t.geometry "geom",       limit: {:srid=>0, :type=>"multi_polygon"}
  end

  add_index "districts", ["geom"], name: "index_districts_on_geom", using: :gist

  create_table "parcels", primary_key: "gid", force: :cascade do |t|
    t.string   "apn",        limit: 20
    t.string   "apn_sort",   limit: 20
    t.string   "book",       limit: 6
    t.string   "page",       limit: 5
    t.string   "parcel",     limit: 4
    t.string   "sub_parcel", limit: 2
    t.string   "clca_categ", limit: 50
    t.string   "comments",   limit: 254
    t.string   "date_creat", limit: 24
    t.string   "date_updat", limit: 24
    t.string   "editor",     limit: 24
    t.decimal  "fid_parcel",                                            precision: 10
    t.decimal  "centroid_x"
    t.decimal  "centroid_y"
    t.decimal  "shape_star"
    t.decimal  "shape_stle"
    t.decimal  "shape_st_1"
    t.decimal  "shape_st_2"
    t.decimal  "shape_st_3"
    t.decimal  "shape_st_4"
    t.geometry "geom",       limit: {:srid=>0, :type=>"multi_polygon"}
  end

  add_index "parcels", ["geom"], name: "index_parcels_on_geom", using: :gist

end
