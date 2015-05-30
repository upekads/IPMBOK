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

ActiveRecord::Schema.define(version: 20150411161300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "data_files", force: true do |t|
    t.string   "project_id"
    t.string   "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "knowledge_areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pmbok_doc_inputs", force: true do |t|
    t.integer  "subprocess_group_id"
    t.integer  "document_id"
    t.integer  "inputdocument_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "task"
  end

  add_index "pmbok_doc_inputs", ["subprocess_group_id"], name: "index_pmbok_doc_inputs_on_subprocess_group_id", using: :btree

  create_table "pmbok_doc_outputs", force: true do |t|
    t.integer  "subprocess_group_id"
    t.integer  "document_id"
    t.integer  "outputdocument_id"
    t.string   "task"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pmbok_doc_outputs", ["subprocess_group_id"], name: "index_pmbok_doc_outputs_on_subprocess_group_id", using: :btree

  create_table "pmbok_docs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subprocess_group_id"
  end

  add_index "pmbok_docs", ["subprocess_group_id"], name: "index_pmbok_docs_on_subprocess_group_id", using: :btree

  create_table "process_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_documents", force: true do |t|
    t.integer  "pmbok_doc_id"
    t.integer  "project_id"
    t.string   "docname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_gid"
    t.integer  "last_version"
    t.integer  "user_id"
    t.string   "status"
  end

  add_index "project_documents", ["pmbok_doc_id"], name: "index_project_documents_on_pmbok_doc_id", using: :btree
  add_index "project_documents", ["project_id"], name: "index_project_documents_on_project_id", using: :btree

  create_table "project_roles", force: true do |t|
    t.string   "rolename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_teams", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "project_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_teams", ["project_id"], name: "index_project_teams_on_project_id", using: :btree
  add_index "project_teams", ["project_role_id"], name: "index_project_teams_on_project_role_id", using: :btree
  add_index "project_teams", ["user_id"], name: "index_project_teams_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.string   "projectcode"
    t.string   "description"
    t.string   "project_gid"
  end

  create_table "roles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subprocess_groups", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "process_group_id"
    t.integer  "knowledge_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subprocess_groups", ["knowledge_area_id"], name: "index_subprocess_groups_on_knowledge_area_id", using: :btree
  add_index "subprocess_groups", ["process_group_id"], name: "index_subprocess_groups_on_process_group_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "project_document_id"
    t.integer  "assignee_id"
    t.integer  "assigned_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "priority"
    t.string   "status"
    t.date     "deadline"
    t.string   "comment"
  end

  add_index "tasks", ["project_document_id"], name: "index_tasks_on_project_document_id", using: :btree

  create_table "templates", force: true do |t|
    t.integer  "pmbok_doc_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  add_index "templates", ["pmbok_doc_id"], name: "index_templates_on_pmbok_doc_id", using: :btree
  add_index "templates", ["user_id"], name: "index_templates_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "access_token"
    t.string   "refresh_token"
    t.string   "uid"
    t.string   "expires"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "versions", force: true do |t|
    t.integer "project_document_id"
    t.string  "docname"
    t.string  "document_gid"
    t.integer "user_id"
  end

  create_table "workflows", force: true do |t|
    t.integer  "subprocess_group_id"
    t.integer  "pmbok_doc_id"
    t.string   "direction"
    t.string   "direction_subprocess"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workflows", ["pmbok_doc_id"], name: "index_workflows_on_pmbok_doc_id", using: :btree
  add_index "workflows", ["subprocess_group_id"], name: "index_workflows_on_subprocess_group_id", using: :btree

end
