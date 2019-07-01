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

ActiveRecord::Schema.define(version: 20190626163344) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "asignaturas", force: :cascade do |t|
    t.integer "colegio_id"
    t.integer "ramo_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sala_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "publisher"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cants", force: :cascade do |t|
    t.integer "curso_id"
    t.integer "profesor_id"
    t.string "creador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coffee_beans", force: :cascade do |t|
    t.string "blend_name"
    t.string "origin"
    t.string "variety"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colegios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinadors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "colegio_id"
    t.integer "departamento_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_coordinadors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_coordinadors_on_reset_password_token", unique: true
  end

  create_table "cursos", force: :cascade do |t|
    t.integer "colegio_id"
    t.integer "profesorjefe_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nivel_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dedicacions", force: :cascade do |t|
    t.integer "profesor_id"
    t.integer "asignatura_id"
    t.integer "dedicacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.integer "colegio_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "ingredient"
    t.string "spice"
    t.string "measurement"
    t.string "store_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hora_lectivas", force: :cascade do |t|
    t.integer "dia_id"
    t.string "posicion"
    t.boolean "activo"
    t.integer "profesor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horas_por_semanas", force: :cascade do |t|
    t.integer "curso_id"
    t.integer "asignatura_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "horasporsemana"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modulos", force: :cascade do |t|
    t.integer "curso_id"
    t.integer "dia_id"
    t.boolean "activo"
    t.integer "posicion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musts", force: :cascade do |t|
    t.integer "curso_id"
    t.integer "profesor_id"
    t.string "creador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nivels", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nopuedes", force: :cascade do |t|
    t.integer "modulo_id"
    t.integer "asignatura_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planificadors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "colegio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_planificadors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_planificadors_on_reset_password_token", unique: true
  end

  create_table "profesors", force: :cascade do |t|
    t.integer "departamento_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ramos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requerimientos", force: :cascade do |t|
    t.integer "nivel_id"
    t.integer "ramo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "requerimiento"
  end

  create_table "salas", force: :cascade do |t|
    t.integer "colegio_id"
    t.integer "disponibilidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tienes", force: :cascade do |t|
    t.integer "modulo_id"
    t.integer "asignatura_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
