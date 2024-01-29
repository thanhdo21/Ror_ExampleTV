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

ActiveRecord::Schema[7.1].define(version: 2024_01_22_095215) do
  create_table "albums", primary_key: "AlbumId", force: :cascade do |t|
    t.string "Title", limit: 160, null: false
    t.integer "ArtistId", null: false
    t.index ["ArtistId"], name: "IFK_AlbumArtistId"
  end

  create_table "artists", primary_key: "ArtistId", force: :cascade do |t|
    t.string "Name", limit: 120
  end

  create_table "customers", primary_key: "CustomerId", force: :cascade do |t|
    t.string "FirstName", limit: 40, null: false
    t.string "LastName", limit: 20, null: false
    t.string "Company", limit: 80
    t.string "Address", limit: 70
    t.string "City", limit: 40
    t.string "State", limit: 40
    t.string "Country", limit: 40
    t.string "PostalCode", limit: 10
    t.string "Phone", limit: 24
    t.string "Fax", limit: 24
    t.string "Email", limit: 60, null: false
    t.integer "SupportRepId"
    t.index ["SupportRepId"], name: "IFK_CustomerSupportRepId"
  end

  create_table "employees", primary_key: "EmployeeId", force: :cascade do |t|
    t.string "LastName", limit: 20, null: false
    t.string "FirstName", limit: 20, null: false
    t.string "Title", limit: 30
    t.integer "ReportsTo"
    t.datetime "BirthDate", precision: nil
    t.datetime "HireDate", precision: nil
    t.string "Address", limit: 70
    t.string "City", limit: 40
    t.string "State", limit: 40
    t.string "Country", limit: 40
    t.string "PostalCode", limit: 10
    t.string "Phone", limit: 24
    t.string "Fax", limit: 24
    t.string "Email", limit: 60
    t.index ["ReportsTo"], name: "IFK_EmployeeReportsTo"
  end

  create_table "genres", primary_key: "GenreId", force: :cascade do |t|
    t.string "Name", limit: 120
  end

  create_table "invoice_items", primary_key: "InvoiceLineId", force: :cascade do |t|
    t.integer "InvoiceId", null: false
    t.integer "TrackId", null: false
    t.decimal "UnitPrice", precision: 10, scale: 2, null: false
    t.integer "Quantity", null: false
    t.index ["InvoiceId"], name: "IFK_InvoiceLineInvoiceId"
    t.index ["TrackId"], name: "IFK_InvoiceLineTrackId"
  end

  create_table "invoices", primary_key: "InvoiceId", force: :cascade do |t|
    t.integer "CustomerId", null: false
    t.datetime "InvoiceDate", precision: nil, null: false
    t.string "BillingAddress", limit: 70
    t.string "BillingCity", limit: 40
    t.string "BillingState", limit: 40
    t.string "BillingCountry", limit: 40
    t.string "BillingPostalCode", limit: 10
    t.decimal "Total", precision: 10, scale: 2, null: false
    t.index ["CustomerId"], name: "IFK_InvoiceCustomerId"
  end

  create_table "media_types", primary_key: "MediaTypeId", force: :cascade do |t|
    t.string "Name", limit: 120
  end

  create_table "playlist_track", primary_key: ["PlaylistId", "TrackId"], force: :cascade do |t|
    t.integer "PlaylistId", null: false
    t.integer "TrackId", null: false
    t.index ["TrackId"], name: "IFK_PlaylistTrackTrackId"
  end

  create_table "playlists", primary_key: "PlaylistId", force: :cascade do |t|
    t.string "Name", limit: 120
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'

  create_table "tracks", primary_key: "TrackId", force: :cascade do |t|
    t.string "Name", limit: 200, null: false
    t.integer "AlbumId"
    t.integer "MediaTypeId", null: false
    t.integer "GenreId"
    t.string "Composer", limit: 220
    t.integer "Milliseconds", null: false
    t.integer "Bytes"
    t.decimal "UnitPrice", precision: 10, scale: 2, null: false
    t.index ["AlbumId"], name: "IFK_TrackAlbumId"
    t.index ["GenreId"], name: "IFK_TrackGenreId"
    t.index ["MediaTypeId"], name: "IFK_TrackMediaTypeId"
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

  add_foreign_key "albums", "artists", column: "ArtistId", primary_key: "ArtistId"
  add_foreign_key "customers", "employees", column: "SupportRepId", primary_key: "EmployeeId"
  add_foreign_key "employees", "employees", column: "ReportsTo", primary_key: "EmployeeId"
  add_foreign_key "invoice_items", "invoices", column: "InvoiceId", primary_key: "InvoiceId"
  add_foreign_key "invoice_items", "tracks", column: "TrackId", primary_key: "TrackId"
  add_foreign_key "invoices", "customers", column: "CustomerId", primary_key: "CustomerId"
  add_foreign_key "playlist_track", "playlists", column: "PlaylistId", primary_key: "PlaylistId"
  add_foreign_key "playlist_track", "tracks", column: "TrackId", primary_key: "TrackId"
  add_foreign_key "tracks", "albums", column: "AlbumId", primary_key: "AlbumId"
  add_foreign_key "tracks", "genres", column: "GenreId", primary_key: "GenreId"
  add_foreign_key "tracks", "media_types", column: "MediaTypeId", primary_key: "MediaTypeId"
end
