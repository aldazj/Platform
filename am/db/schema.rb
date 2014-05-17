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

ActiveRecord::Schema.define(version: 20140507190551) do

  create_table "assets", force: true do |t|
    t.integer  "videoitem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "assets", ["videoitem_id"], name: "index_assets_on_videoitem_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "message"
    t.boolean  "is_available"
    t.date     "date"
    t.string   "url"
    t.integer  "videoitem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "comments", ["person_id"], name: "index_comments_on_person_id", using: :btree
  add_index "comments", ["videoitem_id"], name: "index_comments_on_videoitem_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_people", force: true do |t|
    t.integer "group_id"
    t.integer "person_id"
  end

  add_index "groups_people", ["group_id"], name: "index_groups_people_on_group_id", using: :btree
  add_index "groups_people", ["person_id"], name: "index_groups_people_on_person_id", using: :btree

  create_table "groups_rights", force: true do |t|
    t.integer "group_id"
    t.integer "right_id"
  end

  add_index "groups_rights", ["group_id"], name: "index_groups_rights_on_group_id", using: :btree
  add_index "groups_rights", ["right_id"], name: "index_groups_rights_on_right_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "email"
    t.date     "dateofbirth"
    t.string   "private_phone"
    t.string   "professional_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "password_digest_confirm"
    t.string   "remember_token"
    t.string   "type"
  end

  create_table "personal_groupsrights", force: true do |t|
    t.integer "personalgroup_id"
    t.integer "right_id"
  end

  add_index "personal_groupsrights", ["personalgroup_id"], name: "index_personal_groupsrights_on_personalgroup_id", using: :btree
  add_index "personal_groupsrights", ["right_id"], name: "index_personal_groupsrights_on_right_id", using: :btree

  create_table "personalgroups", force: true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personalgroups", ["person_id"], name: "index_personalgroups_on_person_id", using: :btree

  create_table "rights", force: true do |t|
    t.string   "name"
    t.boolean  "is_available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videoitems", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "is_available"
    t.date     "date"
    t.integer  "views"
    t.string   "pathvideo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "videoitems", ["person_id"], name: "index_videoitems_on_person_id", using: :btree

end
