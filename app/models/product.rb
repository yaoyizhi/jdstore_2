class Product < ApplicationRecord
    mount_uploader :imager, ImageUploader
end
