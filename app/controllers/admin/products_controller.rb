class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
      flash[:notice] = "create success"
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path
      flash[:alert] = "update success"
    else
      render :edit
    end
  end


  private
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end
