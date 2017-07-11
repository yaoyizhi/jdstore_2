class Cart < ApplicationRecord
    has_many :cart_items
    has_many :products, throught: :cart_items, source: :product
    def add_product_to_cart(product)
        ci = cart_items.create(product: product)
    end
end
