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

ActiveRecord::Schema[7.0].define(version: 2023_10_20_081403) do
  create_table "branch_clans", force: :cascade do |t|
    t.integer "branch_clan_id"
    t.text "clan_detail"
    t.integer "clan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_id"], name: "index_branch_clans_on_clan_id"
  end

  create_table "branch_creations", force: :cascade do |t|
    t.text "request"
    t.text "user_detail"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "children", force: :cascade do |t|
    t.text "family"
    t.integer "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_children_on_partner_id"
  end

  create_table "clan_creations", force: :cascade do |t|
    t.text "request"
    t.text "user_detail"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clan_details", force: :cascade do |t|
    t.string "name"
    t.string "details"
    t.integer "branch_clan_id"
    t.integer "clan_id"
    t.integer "clan_details_edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_clan_id"], name: "index_clan_details_on_branch_clan_id"
    t.index ["clan_details_edit_id"], name: "index_clan_details_on_clan_details_edit_id"
    t.index ["clan_id"], name: "index_clan_details_on_clan_id"
  end

  create_table "clan_details_edits", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.string "reason"
    t.boolean "approved"
    t.integer "clan_detail"
    t.text "user_detail"
    t.text "comment"
    t.integer "edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edit_id"], name: "index_clan_details_edits_on_edit_id"
  end

  create_table "clan_histories", force: :cascade do |t|
    t.text "history"
    t.integer "clan_id"
    t.integer "clan_history_delete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_history_delete_id"], name: "index_clan_histories_on_clan_history_delete_id"
    t.index ["clan_id"], name: "index_clan_histories_on_clan_id"
  end

  create_table "clan_history_deletes", force: :cascade do |t|
    t.string "reason"
    t.text "user_detail"
    t.text "clan_history"
    t.text "comment"
    t.boolean "cancelled"
    t.integer "delete_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delete_collection_id"], name: "index_clan_history_deletes_on_delete_collection_id"
  end

  create_table "clan_history_edits", force: :cascade do |t|
    t.integer "history_edit"
    t.integer "history"
    t.integer "user_detail"
    t.string "reason"
    t.boolean "approved"
    t.integer "edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edit_id"], name: "index_clan_history_edits_on_edit_id"
  end

  create_table "clan_requests", force: :cascade do |t|
    t.string "details"
    t.text "user_detail"
    t.boolean "approved"
    t.integer "clan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_id"], name: "index_clan_requests_on_clan_id"
  end

  create_table "clans", force: :cascade do |t|
    t.text "clan_detail"
    t.text "clan_history"
    t.text "family"
    t.text "member"
    t.text "branch_clan"
    t.text "edit"
    t.text "memory"
    t.text "clan_request"
    t.text "delete_collection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_detail"
    t.text "details"
    t.integer "history_edit_id"
    t.integer "clan_details_edit_id"
    t.integer "family_edit_id"
    t.integer "partner_edit_id"
    t.integer "family_delete_id"
    t.integer "partner_delete_id"
    t.integer "clan_history_delete_id"
    t.integer "family_history_delete_id"
    t.integer "memory_delete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_details_edit_id"], name: "index_comments_on_clan_details_edit_id"
    t.index ["clan_history_delete_id"], name: "index_comments_on_clan_history_delete_id"
    t.index ["family_delete_id"], name: "index_comments_on_family_delete_id"
    t.index ["family_edit_id"], name: "index_comments_on_family_edit_id"
    t.index ["family_history_delete_id"], name: "index_comments_on_family_history_delete_id"
    t.index ["history_edit_id"], name: "index_comments_on_history_edit_id"
    t.index ["memory_delete_id"], name: "index_comments_on_memory_delete_id"
    t.index ["partner_delete_id"], name: "index_comments_on_partner_delete_id"
    t.index ["partner_edit_id"], name: "index_comments_on_partner_edit_id"
  end

  create_table "delete_collections", force: :cascade do |t|
    t.text "family_delete"
    t.text "partner_delete"
    t.text "clan_history_delete"
    t.text "family_history_delete"
    t.text "memory_delete"
    t.integer "clan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_id"], name: "index_delete_collections_on_clan_id"
  end

  create_table "edits", force: :cascade do |t|
    t.text "memory_edit"
    t.text "family_history_edit"
    t.text "clan_history_edit"
    t.text "partner_edit"
    t.text "family_edit"
    t.text "clan_details_edit"
    t.integer "clan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_id"], name: "index_edits_on_clan_id"
  end

  create_table "families", force: :cascade do |t|
    t.text "person"
    t.text "partner"
    t.text "children"
    t.integer "parentId"
    t.text "family_history"
    t.integer "clan_id"
    t.integer "child_id"
    t.integer "family_edit_id"
    t.integer "family_delete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_families_on_child_id"
    t.index ["clan_id"], name: "index_families_on_clan_id"
    t.index ["family_delete_id"], name: "index_families_on_family_delete_id"
    t.index ["family_edit_id"], name: "index_families_on_family_edit_id"
  end

  create_table "family_deletes", force: :cascade do |t|
    t.string "reason"
    t.text "user_detail"
    t.text "family"
    t.text "comment"
    t.boolean "cancelled"
    t.integer "delete_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delete_collection_id"], name: "index_family_deletes_on_delete_collection_id"
  end

  create_table "family_edits", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "reason"
    t.text "comment"
    t.text "user_detail"
    t.text "family"
    t.integer "edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edit_id"], name: "index_family_edits_on_edit_id"
  end

  create_table "family_histories", force: :cascade do |t|
    t.text "history"
    t.integer "family_id"
    t.integer "family_history_delete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_history_delete_id"], name: "index_family_histories_on_family_history_delete_id"
    t.index ["family_id"], name: "index_family_histories_on_family_id"
  end

  create_table "family_history_deletes", force: :cascade do |t|
    t.string "reason"
    t.text "user_detail"
    t.text "family_history"
    t.text "comment"
    t.boolean "cancelled"
    t.integer "delete_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delete_collection_id"], name: "index_family_history_deletes_on_delete_collection_id"
  end

  create_table "family_history_edits", force: :cascade do |t|
    t.integer "history_edit"
    t.integer "history"
    t.integer "user_detail"
    t.string "reason"
    t.boolean "approved"
    t.integer "edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edit_id"], name: "index_family_history_edits_on_edit_id"
  end

  create_table "histories", force: :cascade do |t|
    t.string "title"
    t.string "details"
    t.integer "clan_history_id"
    t.integer "family_history_id"
    t.integer "memory_id"
    t.integer "clan_history_edit_id"
    t.integer "family_history_edit_id"
    t.integer "memory_edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_history_edit_id"], name: "index_histories_on_clan_history_edit_id"
    t.index ["clan_history_id"], name: "index_histories_on_clan_history_id"
    t.index ["family_history_edit_id"], name: "index_histories_on_family_history_edit_id"
    t.index ["family_history_id"], name: "index_histories_on_family_history_id"
    t.index ["memory_edit_id"], name: "index_histories_on_memory_edit_id"
    t.index ["memory_id"], name: "index_histories_on_memory_id"
  end

  create_table "history_edits", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.text "comment"
    t.integer "memory_edit_id"
    t.integer "family_history_edit_id"
    t.integer "clan_history_edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_history_edit_id"], name: "index_history_edits_on_clan_history_edit_id"
    t.index ["family_history_edit_id"], name: "index_history_edits_on_family_history_edit_id"
    t.index ["memory_edit_id"], name: "index_history_edits_on_memory_edit_id"
  end

  create_table "members", force: :cascade do |t|
    t.text "person"
    t.boolean "officer"
    t.text "user_detail"
    t.text "clan_detail"
    t.integer "clan_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_id"], name: "index_members_on_clan_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "memories", force: :cascade do |t|
    t.text "history"
    t.integer "clan_id"
    t.integer "memory_delete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clan_id"], name: "index_memories_on_clan_id"
    t.index ["memory_delete_id"], name: "index_memories_on_memory_delete_id"
  end

  create_table "memory_deletes", force: :cascade do |t|
    t.string "reason"
    t.text "user_detail"
    t.text "memory"
    t.text "comment"
    t.boolean "cancelled"
    t.integer "delete_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delete_collection_id"], name: "index_memory_deletes_on_delete_collection_id"
  end

  create_table "memory_edits", force: :cascade do |t|
    t.integer "history_edit"
    t.integer "history"
    t.integer "user_detail"
    t.string "reason"
    t.boolean "approved"
    t.integer "edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edit_id"], name: "index_memory_edits_on_edit_id"
  end

  create_table "partner_deletes", force: :cascade do |t|
    t.string "reason"
    t.text "user_detail"
    t.text "partner"
    t.text "comment"
    t.boolean "cancelled"
    t.integer "delete_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delete_collection_id"], name: "index_partner_deletes_on_delete_collection_id"
  end

  create_table "partner_edits", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "reason"
    t.text "comment"
    t.text "user_detail"
    t.text "partner"
    t.integer "edit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edit_id"], name: "index_partner_edits_on_edit_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "partner"
    t.string "status"
    t.text "children"
    t.boolean "has_children"
    t.integer "person_id"
    t.integer "partner_edit_id"
    t.integer "partner_delete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_delete_id"], name: "index_partners_on_partner_delete_id"
    t.index ["partner_edit_id"], name: "index_partners_on_partner_edit_id"
    t.index ["person_id"], name: "index_partners_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.text "partner"
    t.string "status"
    t.integer "family_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_people_on_family_id"
    t.index ["member_id"], name: "index_people_on_member_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "main_clan"
    t.integer "clan_creation_id"
    t.integer "branch_creation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_creation_id"], name: "index_requests_on_branch_creation_id"
    t.index ["clan_creation_id"], name: "index_requests_on_clan_creation_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.string "name"
    t.integer "clan_request_id"
    t.integer "branch_creation_id"
    t.integer "clan_creation_id"
    t.integer "comment_id"
    t.integer "memory_edit_id"
    t.integer "family_history_edit_id"
    t.integer "clan_history_edit_id"
    t.integer "family_edit_id"
    t.integer "partner_edit_id"
    t.integer "clan_details_edit_id"
    t.integer "family_delete_id"
    t.integer "partner_delete_id"
    t.integer "clan_history_delete_id"
    t.integer "family_history_delete_id"
    t.integer "memory_delete_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_creation_id"], name: "index_user_details_on_branch_creation_id"
    t.index ["clan_creation_id"], name: "index_user_details_on_clan_creation_id"
    t.index ["clan_details_edit_id"], name: "index_user_details_on_clan_details_edit_id"
    t.index ["clan_history_delete_id"], name: "index_user_details_on_clan_history_delete_id"
    t.index ["clan_history_edit_id"], name: "index_user_details_on_clan_history_edit_id"
    t.index ["clan_request_id"], name: "index_user_details_on_clan_request_id"
    t.index ["comment_id"], name: "index_user_details_on_comment_id"
    t.index ["family_delete_id"], name: "index_user_details_on_family_delete_id"
    t.index ["family_edit_id"], name: "index_user_details_on_family_edit_id"
    t.index ["family_history_delete_id"], name: "index_user_details_on_family_history_delete_id"
    t.index ["family_history_edit_id"], name: "index_user_details_on_family_history_edit_id"
    t.index ["memory_delete_id"], name: "index_user_details_on_memory_delete_id"
    t.index ["memory_edit_id"], name: "index_user_details_on_memory_edit_id"
    t.index ["partner_delete_id"], name: "index_user_details_on_partner_delete_id"
    t.index ["partner_edit_id"], name: "index_user_details_on_partner_edit_id"
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.string "password_hash"
    t.string "token"
    t.integer "phone"
    t.text "member"
    t.text "user_detail"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branch_clans", "clans"
  add_foreign_key "clan_details", "branch_clans"
  add_foreign_key "clan_details", "clan_details_edits"
  add_foreign_key "clan_details", "clans"
  add_foreign_key "clan_details_edits", "edits"
  add_foreign_key "clan_histories", "clan_history_deletes"
  add_foreign_key "clan_histories", "clans"
  add_foreign_key "clan_history_deletes", "delete_collections"
  add_foreign_key "clan_history_edits", "edits"
  add_foreign_key "clan_requests", "clans"
  add_foreign_key "comments", "clan_details_edits"
  add_foreign_key "comments", "clan_history_deletes"
  add_foreign_key "comments", "family_deletes"
  add_foreign_key "comments", "family_edits"
  add_foreign_key "comments", "family_history_deletes"
  add_foreign_key "comments", "history_edits"
  add_foreign_key "comments", "memory_deletes"
  add_foreign_key "comments", "partner_deletes"
  add_foreign_key "comments", "partner_edits"
  add_foreign_key "delete_collections", "clans"
  add_foreign_key "edits", "clans"
  add_foreign_key "families", "children"
  add_foreign_key "families", "clans"
  add_foreign_key "families", "family_deletes"
  add_foreign_key "families", "family_edits"
  add_foreign_key "family_deletes", "delete_collections"
  add_foreign_key "family_edits", "edits"
  add_foreign_key "family_histories", "families"
  add_foreign_key "family_histories", "family_history_deletes"
  add_foreign_key "family_history_deletes", "delete_collections"
  add_foreign_key "family_history_edits", "edits"
  add_foreign_key "histories", "clan_histories"
  add_foreign_key "histories", "clan_history_edits"
  add_foreign_key "histories", "family_histories"
  add_foreign_key "histories", "family_history_edits"
  add_foreign_key "histories", "memories"
  add_foreign_key "histories", "memory_edits"
  add_foreign_key "history_edits", "clan_history_edits"
  add_foreign_key "history_edits", "family_history_edits"
  add_foreign_key "history_edits", "memory_edits"
  add_foreign_key "members", "clans"
  add_foreign_key "members", "users"
  add_foreign_key "memories", "clans"
  add_foreign_key "memories", "memory_deletes"
  add_foreign_key "memory_deletes", "delete_collections"
  add_foreign_key "memory_edits", "edits"
  add_foreign_key "partner_deletes", "delete_collections"
  add_foreign_key "partner_edits", "edits"
  add_foreign_key "partners", "partner_deletes"
  add_foreign_key "partners", "partner_edits"
  add_foreign_key "partners", "people"
  add_foreign_key "people", "families"
  add_foreign_key "people", "members"
  add_foreign_key "requests", "branch_creations"
  add_foreign_key "requests", "clan_creations"
  add_foreign_key "user_details", "branch_creations"
  add_foreign_key "user_details", "clan_creations"
  add_foreign_key "user_details", "clan_details_edits"
  add_foreign_key "user_details", "clan_history_deletes"
  add_foreign_key "user_details", "clan_history_edits"
  add_foreign_key "user_details", "clan_requests"
  add_foreign_key "user_details", "comments"
  add_foreign_key "user_details", "family_deletes"
  add_foreign_key "user_details", "family_edits"
  add_foreign_key "user_details", "family_history_deletes"
  add_foreign_key "user_details", "family_history_edits"
  add_foreign_key "user_details", "memory_deletes"
  add_foreign_key "user_details", "memory_edits"
  add_foreign_key "user_details", "partner_deletes"
  add_foreign_key "user_details", "partner_edits"
  add_foreign_key "user_details", "users"
end
