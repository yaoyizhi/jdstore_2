class OrdersController < ApplicationController
    def create
        @order.user = current_user
        @order.total = current_cart.total_price
        @order = Order.new(order_params)
        if @order.save
            current_cart.cart_items each do
                product_list = product_list.new
                product_list.product_name = cart_item.product.title
                product_list.product_price = cart_item.product.product.price
                product_list.quantity = cart_item.quantity
                product.save
            end
            redirect_to order_path(@order)
        else
            render 'carts/checkout'
        end
    end

    def show
        @order = @order.find(params[:id])
        @product_list = @order.product_list
    end

    private

    def order_params
        params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
    end
end
