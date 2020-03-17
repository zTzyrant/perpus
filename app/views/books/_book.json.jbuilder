json.extract! book, :id, :judul_buku, :author, :genre_buku, :rating, :created_at, :updated_at
json.url book_url(book, format: :json)
