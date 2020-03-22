class Book < ApplicationRecord
    has_many :pinjam
    validates :image, file_size: { less_than: 1.megabytes }
    mount_uploader :image, ImageUploader
end
