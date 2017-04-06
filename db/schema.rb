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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170406030419) do
=======
ActiveRecord::Schema.define(version: 20170404050410) do
>>>>>>> 3fbe1046d29e92ab73039366db81cab52d36d264

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
    t.integer  "user_id"
  end

<<<<<<< HEAD
  create_table "book_shelves", force: :cascade do |t|
    t.integer "tutorial_id"
    t.integer "user_id"
    t.boolean "completed",   default: false
  end

  create_table "bookshelf", force: :cascade do |t|
    t.integer  "tutorial_id"
    t.integer  "user_id"
    t.boolean  "completed",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

=======
>>>>>>> 3fbe1046d29e92ab73039366db81cab52d36d264
  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

<<<<<<< HEAD
  create_table "favorite_tutorials", force: :cascade do |t|
    t.integer  "tutorial_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

=======
>>>>>>> 3fbe1046d29e92ab73039366db81cab52d36d264
  create_table "items", force: :cascade do |t|
    t.text     "description"
    t.boolean  "is_done",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "tutorial_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "text"
    t.string   "author"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "tutorial_img_file_name"
    t.string   "tutorial_img_content_type"
    t.integer  "tutorial_img_file_size"
    t.datetime "tutorial_img_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.boolean  "admin"
    t.boolean  "is_online"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
<<<<<<< HEAD
    t.datetime "last_seen_at"
=======
>>>>>>> 3fbe1046d29e92ab73039366db81cab52d36d264
  end

end
