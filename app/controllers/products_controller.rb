class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
  end
  def show
    @products = Product.find(params[:id])
  end

end
