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

ActiveRecord::Schema.define(version: 2020_07_28_051522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.string "phone_number"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_companies_on_product_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "payment_controls", force: :cascade do |t|
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_payment_controls_on_user_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.datetime "date"
    t.float "credit"
    t.float "payment"
    t.bigint "product_id"
    t.bigint "payment_control_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_control_id"], name: "index_payment_details_on_payment_control_id"
    t.index ["product_id"], name: "index_payment_details_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_code"
    t.string "product_name"
    t.string "product_image"
    t.float "product_price"
    t.float "product_cost"
    t.float "product_discount"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "products"
  add_foreign_key "companies", "users"
  add_foreign_key "payment_controls", "users"
  add_foreign_key "payment_details", "payment_controls"
  add_foreign_key "payment_details", "products"
  add_foreign_key "products", "categories"
end
