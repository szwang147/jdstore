class CartsController < ApplicationController
  def checkout
      @order = Order.new
    end

    def index
      @cart = current_cart
      @cart_items = @cart.cart_items.all
    end



 def destroy
   @cart = current_cart
   @cart.destroy
   session[:cart_id] = nil
   redirect_to :back, notice: "我要一键清空"
 end

 def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end
  def checkout
    @order = Order.new
  end




 end
