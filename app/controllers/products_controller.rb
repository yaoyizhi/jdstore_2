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
        current_cart.add_product_to_cart(@product)
        redirect_to product_path
        flash[:notice] = '成功加入购物车！'
    end
end
