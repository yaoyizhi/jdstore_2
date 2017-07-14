class CartsController < ApplicationController
    def clean
        @cart = current_cart
        @cart.clean!
        flash[:notice] = '已清空购物车'
        redirect_to carts_path
    end

    def checkout
        @order = Order.new
    end
end
