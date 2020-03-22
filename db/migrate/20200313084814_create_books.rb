class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :judul_buku
      t.string :author
      t.string :genre_buku
      t.integer :rating
      t.string :image

      t.timestamps
    end
  end
end
