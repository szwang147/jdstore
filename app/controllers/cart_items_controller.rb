class CartItemsController < ApplicationController
  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to :back
  end

  def edit
    @cart_item = CartItem.find(params[:id])
  end

  def change_quantity(quantity_params)
    cart_id = params[:cart_item_id]
    @cart = current_cart
    @cart_item = CartItem.find(params[:id])

    if quantity <= @cart_item.product.quantity
      @cart_item.quantity = quantity_params
      @cart_item.save!
      redirect_to :back
    else
      redirect_to :back, notice: '我已经没有货可以卖了'
    end
  end


  def update
   @cart =current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.product.quantity >= quantity_params[:quantity]
      @cart_item.update(quantity_params)
       flash[:notice] ="Your items has been modified"
     else
       flash[:warning] ="no enough goods"
     end
     redirect_to carts_path
end

  private

  def quantity_params
    params.require(:cart_item).permit(:quanity)
  end
end
