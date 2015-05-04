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

ActiveRecord::Schema.define(:version => 20150504042955) do

  create_table "buy_orders", :force => true do |t|
    t.string   "address"
    t.string   "rut"
    t.string   "name"
    t.date     "date"
    t.integer  "discount"
    t.string   "telephone"
    t.string   "sell_condition"
    t.string   "dispatch"
    t.string   "email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "codigo_items", :force => true do |t|
    t.string   "tpoCodigo"
    t.string   "vlrCodigo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "detalles", :force => true do |t|
    t.string   "tpoDocLiq"
    t.integer  "indExe"
    t.string   "indAgente"
    t.float    "mntBaseFaena"
    t.float    "mntMargComer"
    t.integer  "prcConsFinal"
    t.string   "nmbItem"
    t.float    "qtyRef"
    t.string   "unmdRef"
    t.float    "prcRef"
    t.float    "qtyItem"
    t.string   "unmdItem"
    t.float    "prcItem"
    t.float    "descuentoMonto"
    t.float    "recargoPct"
    t.float    "recargoMonto"
    t.float    "montoItem"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "documentos", :force => true do |t|
    t.string   "version"
    t.integer  "folio"
    t.date     "fechEmis"
    t.integer  "indNoRebaja"
    t.integer  "tipoDespacho"
    t.integer  "indTraslado"
    t.string   "tpoImpresion"
    t.integer  "indServicio"
    t.float    "mntBruto"
    t.integer  "fmaPago"
    t.integer  "fmaPagExp"
    t.date     "fchCancel"
    t.float    "mntCancel"
    t.float    "saldoInsol"
    t.date     "fchVenc"
    t.string   "RUTEmisor"
    t.string   "rznSoc"
    t.string   "giroEmis"
    t.integer  "acteco"
    t.integer  "cdgTraslado"
    t.integer  "folioAut"
    t.date     "fchAut"
    t.integer  "cdgSIISucur"
    t.string   "dirOrigen"
    t.string   "cmnaOrigen"
    t.string   "ciudadOrigen"
    t.string   "RUTMandante"
    t.string   "RUTRecep"
    t.string   "rznSocRecep"
    t.string   "giroRecep"
    t.string   "dirRecep"
    t.string   "cmnaRecep"
    t.string   "ciudadRecep"
    t.string   "RUTSolicita"
    t.string   "patente"
    t.string   "RUTTrans"
    t.string   "RUTChofer"
    t.string   "nombreChofer"
    t.string   "dirDest"
    t.string   "cmnaDest"
    t.string   "ciudadDest"
    t.integer  "codModVenta"
    t.integer  "codClauVenta"
    t.float    "totClauVenta"
    t.integer  "codViaTransp"
    t.integer  "codPtoEmbarque"
    t.integer  "codPtoDesemb"
    t.integer  "codUnidMedTara"
    t.float    "pesoBruto"
    t.integer  "codUnidPesoBruto"
    t.integer  "codUnidPesoNeto"
    t.integer  "totBultos"
    t.string   "codPaisRecep"
    t.string   "codPaisDestin"
    t.string   "tpoMoneda"
    t.float    "mntNeto"
    t.float    "mntExe"
    t.float    "mntBase"
    t.float    "mntMargenCom"
    t.float    "tasaIVA"
    t.float    "IVA"
    t.float    "IVANoRet"
    t.float    "credEC"
    t.float    "grntDep"
    t.float    "valComNeto"
    t.float    "valComExe"
    t.float    "valComIVA"
    t.float    "mntTotal"
    t.float    "montoNF"
    t.string   "tpoMoneda_OtraMoneda"
    t.float    "TpoCambio"
    t.float    "mntNetoOtrMnda"
    t.float    "mntExeOtrMnda"
    t.float    "mntFaeCarneOtrMnda"
    t.float    "mntMargComOtrMnda"
    t.float    "IVAOtrMnda"
    t.float    "IVANoRetOtrMnda"
    t.float    "mntTotOtrMnda"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "buy_order_id"
  end

  add_index "order_items", ["buy_order_id"], :name => "index_order_items_on_buy_order_id"
  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], :name => "index_order_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.string   "rut"
    t.string   "address"
    t.string   "telephone"
    t.string   "email"
    t.string   "sell_condition"
    t.integer  "subtotal"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "code"
    t.date     "date"
    t.integer  "discount"
    t.string   "dispatch"
  end

  create_table "products", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "buy_price"
    t.integer  "sell_price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "products", ["code"], :name => "index_products_on_code", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
