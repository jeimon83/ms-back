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

ActiveRecord::Schema[7.0].define(version: 20_231_018_202_325) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'antennas', force: :cascade do |t|
    t.string 'cpa'
    t.string 'location'
    t.bigint 'customer_id', null: false
    t.string 'service'
    t.boolean 'state', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['customer_id'], name: 'index_antennas_on_customer_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'address'
    t.string 'contact'
    t.string 'cuit'
    t.string 'email'
    t.string 'name'
    t.string 'phone'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'providers', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'services', force: :cascade do |t|
    t.string 'technology'
    t.string 'bandwith'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'antennas', 'customers'
end
