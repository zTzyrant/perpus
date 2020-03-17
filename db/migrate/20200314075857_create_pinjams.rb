class CreatePinjams < ActiveRecord::Migration[6.0]
  def change
    create_table :pinjams do |t|
      t.string :nama
      t.string :phone
      t.string :alamat
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
