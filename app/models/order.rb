class Order < ApplicationRecord
    belongs_to :user
    has_many :product_list
end
