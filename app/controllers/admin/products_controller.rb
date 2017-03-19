class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to admin_products_path, notice: "成功创建!"
    else
    render :new
    end
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.save(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path,alert: "你已成功删除！"
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end

end
