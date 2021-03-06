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

ActiveRecord::Schema.define(version: 2018_06_19_141033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ecoles", force: :cascade do |t|
    t.string "nom"
    t.string "adresse"
    t.string "responsable"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "telephone"
  end

  create_table "interventions", force: :cascade do |t|
    t.string "date_contact"
    t.string "date_intervention"
    t.string "statut"
    t.bigint "theme_id"
    t.bigint "ecole_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ecole_id"], name: "index_interventions_on_ecole_id"
    t.index ["theme_id"], name: "index_interventions_on_theme_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "plaideur_interventions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "intervention_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intervention_id"], name: "index_plaideur_interventions_on_intervention_id"
    t.index ["user_id"], name: "index_plaideur_interventions_on_user_id"
  end

  create_table "professeurs", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.bigint "ecole_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ecole_id"], name: "index_professeurs_on_ecole_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prenom"
    t.string "nom"
    t.string "tel"
    t.boolean "admin"
    t.string "niveau"
    t.bigint "theme_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["theme_id"], name: "index_users_on_theme_id"
  end

  add_foreign_key "interventions", "ecoles"
  add_foreign_key "interventions", "themes"
  add_foreign_key "plaideur_interventions", "interventions"
  add_foreign_key "plaideur_interventions", "users"
  add_foreign_key "professeurs", "ecoles"
  add_foreign_key "users", "themes"
end
