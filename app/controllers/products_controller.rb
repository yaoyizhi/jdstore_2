class ProductsController < ApplicationController
    before_action :authenticate_user!
    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def add_to_cart
        @product = Product.find(params[:id])
        if !current_cart.products.include?(@product)
            current_cart.add_product_to_cart(@product)
            flash[:notice] = "你已成功将 #{@product.title} 加入购物车！"
        else
            flash[:warning] = '你的购物车已有此物！'
          end
        redirect_to product_path
    end
end
