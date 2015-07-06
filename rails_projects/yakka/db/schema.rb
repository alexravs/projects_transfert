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

ActiveRecord::Schema.define(version: 20150703121242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", primary_key: "cat_id", force: :cascade do |t|
    t.string  "cat_nom",  limit: 25, null: false
    t.integer "cat_stat",            null: false
  end

  create_table "characteristics", primary_key: "car_id", force: :cascade do |t|
    t.integer "car_fk_products",              null: false
    t.integer "car_fk_properties", limit: 2,  null: false
    t.string  "car_valeur",        limit: 20
  end

  create_table "clients", primary_key: "cli_id", force: :cascade do |t|
    t.string "cli_nom",          limit: 25, null: false
    t.string "cli_prenom",       limit: 20, null: false
    t.string "cli_adresse",      limit: 50, null: false
    t.string "cli_cp",           limit: 10, null: false
    t.string "cli_localite",     limit: 50, null: false
    t.string "cli_fk_pays",      limit: 2,  null: false
    t.string "cli_telephone",    limit: 20, null: false
    t.string "cli_numero_carte", limit: 20, null: false
    t.string "cli_mot_passe",    limit: 50, null: false
    t.string "cli_email",        limit: 40, null: false
  end

  create_table "combinaisons", id: false, force: :cascade do |t|
    t.integer "com_fk_characteristics",   null: false
    t.integer "com_fk_identifiant_combi", null: false
  end

  add_index "combinaisons", ["com_fk_characteristics", "com_fk_identifiant_combi"], name: "index_combinaisons", unique: true, using: :btree

  create_table "countries", primary_key: "pays_abreviation", force: :cascade do |t|
    t.string  "pays_nom",  limit: 20
    t.decimal "pays_port",            precision: 5, scale: 2
  end

  create_table "identifiant_combi", primary_key: "idc_id", force: :cascade do |t|
    t.integer "idc_fk_prices", null: false
  end

  create_table "order_rows", primary_key: "row_id", force: :cascade do |t|
    t.integer "row_fk_orders",                      null: false
    t.integer "row_fk_identifiant_combi",           null: false
    t.integer "row_quantity",             limit: 2, null: false
  end

  create_table "orders", primary_key: "com_id", force: :cascade do |t|
    t.date    "com_date",                       null: false
    t.boolean "com_facture",    default: false, null: false
    t.integer "com_fk_clients",                 null: false
  end

  create_table "prices", primary_key: "pri_id", force: :cascade do |t|
    t.decimal "pri_htva_euro",           precision: 6, scale: 3, null: false
    t.decimal "pri_poids",               precision: 4, scale: 2
    t.decimal "pri_vol_conditionnement", precision: 3, scale: 2
  end

  create_table "products", primary_key: "prod_id", force: :cascade do |t|
    t.string  "prod_nom",               limit: 20,  null: false
    t.string  "prod_vignette",          limit: 100, null: false
    t.string  "prod_image",             limit: 100, null: false
    t.string  "prod_descr_courte",      limit: 100, null: false
    t.string  "prod_descr_longue",      limit: 500, null: false
    t.integer "prod_stat",                          null: false
    t.integer "prod_fk_sub_categories"
  end

  create_table "properties", primary_key: "prop_id", force: :cascade do |t|
    t.string "prop_nom", limit: 20, null: false
  end

  create_table "relations", id: false, force: :cascade do |t|
    t.integer "rel_fk_products_princ", null: false
    t.integer "rel_fk_products_sec",   null: false
  end

  add_index "relations", ["rel_fk_products_princ", "rel_fk_products_sec"], name: "index_relations", unique: true, using: :btree

  create_table "sub_categories", primary_key: "sscat_id", force: :cascade do |t|
    t.string  "sscat_nom",           limit: 30, null: false
    t.integer "sscat_fk_categories",            null: false
    t.integer "sscat_stat",                     null: false
  end

  add_foreign_key "characteristics", "products", column: "car_fk_products", primary_key: "prod_id", name: "characteristics_car_fk_products_fkey"
  add_foreign_key "characteristics", "properties", column: "car_fk_properties", primary_key: "prop_id", name: "characteristics_car_fk_properties_fkey"
  add_foreign_key "clients", "countries", column: "cli_fk_pays", primary_key: "pays_abreviation", name: "clients_cli_fk_pays_fkey"
  add_foreign_key "combinaisons", "characteristics", column: "com_fk_characteristics", primary_key: "car_id", name: "combinaisons_com_fk_characteristics_fkey"
  add_foreign_key "combinaisons", "identifiant_combi", column: "com_fk_identifiant_combi", primary_key: "idc_id", name: "combinaisons_com_fk_identifiant_combi_fkey"
  add_foreign_key "identifiant_combi", "prices", column: "idc_fk_prices", primary_key: "pri_id", name: "identifiant_combi_idc_fk_prices_fkey"
  add_foreign_key "order_rows", "identifiant_combi", column: "row_fk_identifiant_combi", primary_key: "idc_id", name: "order_rows_row_fk_identifiant_combi_fkey"
  add_foreign_key "order_rows", "orders", column: "row_fk_orders", primary_key: "com_id", name: "order_rows_row_fk_orders_fkey"
  add_foreign_key "orders", "clients", column: "com_fk_clients", primary_key: "cli_id", name: "orders_com_fk_clients_fkey"
  add_foreign_key "products", "sub_categories", column: "prod_fk_sub_categories", primary_key: "sscat_id", name: "products_prod_fk_sub_categories_fkey"
  add_foreign_key "relations", "products", column: "rel_fk_products_princ", primary_key: "prod_id", name: "relations_rel_fk_products_princ_fkey"
  add_foreign_key "relations", "products", column: "rel_fk_products_sec", primary_key: "prod_id", name: "relations_rel_fk_products_sec_fkey"
  add_foreign_key "sub_categories", "categories", column: "sscat_fk_categories", primary_key: "cat_id", name: "sub_categories_sscat_fk_categories_fkey"
end
