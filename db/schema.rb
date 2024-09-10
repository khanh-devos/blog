# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_10_154807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "user_permissions", ["Full_control_on_Topic", "Full_control_on_Comment_or_Like"]

  create_table "admins", force: :cascade do |t|
    t.string "username", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "permission", default: "Full_control_on_Comment_or_Like", null: false, enum_type: "user_permissions"
    t.index ["username"], name: "unique_username", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_comments_on_topic_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.boolean "value", null: false
    t.bigint "user_id", null: false
    t.string "object_type", null: false
    t.bigint "object_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["object_type", "object_id"], name: "index_likes_on_object"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", limit: 200, null: false
    t.string "img_url", limit: 200
    t.text "content", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_topics_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "function_type"
    t.bigint "function_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["function_type", "function_id"], name: "index_users_on_function"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "surname", limit: 100, null: false
    t.string "lastname", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surname"], name: "index_visitors_on_surname", unique: true
  end

  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "topics", "admins", column: "author_id"
end
