module Admin::OrdersHelper
    def render_order_paid_state(order)
        if !order.is_paid
            ' 未付款'
        else
            '已付款'
        end
    end
end
