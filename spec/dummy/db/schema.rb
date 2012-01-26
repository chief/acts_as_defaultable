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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20120105110842) do
=======
ActiveRecord::Schema.define(:version => 20120104234100) do
>>>>>>> a78d85a48420ac87365e2329405c3644dc18a672

  create_table "anothers", :force => true do |t|
    t.string   "test"
    t.integer  "unique"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "boolean_defaults", :force => true do |t|
    t.string   "name"
    t.boolean  "default"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fail_ones", :force => true do |t|
    t.string   "name"
    t.boolean  "default"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "string_defaults", :force => true do |t|
    t.string   "name"
    t.string   "default"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

<<<<<<< HEAD
  create_table "users", :force => true do |t|
    t.string   "role"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "without_cancans", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
=======
  create_table "test_defaults", :force => true do |t|
    t.string   "name"
    t.boolean  "default",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
>>>>>>> a78d85a48420ac87365e2329405c3644dc18a672
  end

end
