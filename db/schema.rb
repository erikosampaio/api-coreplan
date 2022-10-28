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

ActiveRecord::Schema.define(version: 2022_10_28_000238) do

  create_table "memoria_rans", force: :cascade do |t|
    t.string "produto"
    t.integer "tamanho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memoria_rans_pedidos", id: false, force: :cascade do |t|
    t.integer "memoria_ram_id", null: false
    t.integer "pedido_id", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "cliente"
    t.integer "processador_id"
    t.integer "placa_mae_id"
    t.integer "placa_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["placa_mae_id"], name: "index_pedidos_on_placa_mae_id"
    t.index ["placa_video_id"], name: "index_pedidos_on_placa_video_id"
    t.index ["processador_id"], name: "index_pedidos_on_processador_id"
  end

  create_table "placa_maes", force: :cascade do |t|
    t.string "produto"
    t.string "processadores_suportados"
    t.integer "quantidade_slots_memoria"
    t.integer "total_memoria_suportada"
    t.string "video_integrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "placa_videos", force: :cascade do |t|
    t.string "produto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processadores", force: :cascade do |t|
    t.string "produto"
    t.string "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
