class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

     def index
       @orders = current_user.orders
   end

   def cancelling
     @order = Order.find_by_token(params[:id])
     @order.apply_cancel!
     OrderMailer.notify_cancelling(@order).deliver!
     redirect_to back, notice:'已经提交取消订单的请求'
   end



   end
