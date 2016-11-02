class CartsController < ApplicationController
  def checkout
      @order = Order.new
    end

    def index
      @cart = current_cart
      @cart_items = @cart.cart_items.all
    end



 def destroy
   @cart = current_cart_
   @cart.destroy
   session[:cart_id] = nil
   redirect_to :back, notice: "我要一键清空"
 end



 end
